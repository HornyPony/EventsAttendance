import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:events_attendance/domain/model/attendance_item.dart';
import 'package:events_attendance/domain/model/current_attendance_item.dart';
import 'package:events_attendance/domain/state/user_state.dart';
import 'package:events_attendance/generated/l10n.dart';
import 'package:events_attendance/get_it.dart';
import 'package:events_attendance/internal/dependencies/events_repository_module.dart';
import 'package:events_attendance/presentation/global_widgets/custom_button.dart';
import 'package:events_attendance/presentation/screens/event_single/parts/current_location_dialog.dart';
import 'package:events_attendance/presentation/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class MarkAttendanceBtn extends StatefulWidget {
  final DateTime startDateTime;
  final DateTime endDateTime;
  final GeoPoint eventGeoPoint;
  final String eventId;

  const MarkAttendanceBtn({
    Key? key,
    required this.eventGeoPoint,
    required this.startDateTime,
    required this.endDateTime,
    required this.eventId,
  }) : super(key: key);

  @override
  State<MarkAttendanceBtn> createState() => _MarkAttendanceBtnState();
}

class _MarkAttendanceBtnState extends State<MarkAttendanceBtn> {
  late bool _isCheckedAtStart;
  late bool _isCheckedAtEnd;

  late Future<AttendanceItem> _attendanceFuture;

  @override
  void initState() {
    _attendanceFuture =
        EventsRepositoryModule.eventsRepository().checkAttendance(
      login: locator.get<UserState>().user!.login,
      eventId: widget.eventId,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _attendanceFuture,
      builder: (BuildContext context, AsyncSnapshot<AttendanceItem> snapshot) {
        if (snapshot.hasData) {
          _isCheckedAtStart = snapshot.data!.isCheckedAtStart;
          _isCheckedAtEnd = snapshot.data!.isCheckedAtEnd;

          return CustomButton(
            disabled: _isCheckedAtEnd,
            onTap: () async {

              if (!_isCheckedAtStart || !_isCheckedAtEnd) {
                CurrentAttendanceItem attendanceItem =
                    await _determinePosition();
                if(context.mounted){
                  await _showFieldDescriptionDialog(
                    context: context,
                    eventId: widget.eventId,
                    attendanceItem: attendanceItem,
                  );
                }

              }
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 12.h),
              decoration: BoxDecoration(
                color: _getBtnColor(),
              ),
              child: Text(
                _getBtnText(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontSize: 14.sp,
                      color: Colors.white,
                    ),
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Color _getBtnColor() {
    Color btnColor = Theme.of(context).primaryColor;
    if (_isCheckedAtStart && _isCheckedAtEnd) {
      btnColor = AppTheme.greenColor;
    } else if (!_isCheckedAtStart && _isCheckedAtEnd) {
      btnColor = AppTheme.orangeColor;
    } else {
      btnColor = Theme.of(context).primaryColor;
    }

    return btnColor;
  }

  String _getBtnText() {
    String btnText = S.of(context).mark_attendance;
    if (_isCheckedAtStart && _isCheckedAtEnd) {
      btnText = S.of(context).event_attended;
    } else if (!_isCheckedAtStart && _isCheckedAtEnd) {
      btnText = S.of(context).event_attended_but_not_at_start;
    } else {
      btnText = S.of(context).mark_attendance;
    }

    return btnText;
  }

  Future<CurrentAttendanceItem> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Position position = await Geolocator.getCurrentPosition();
    DateTime currentTime = position.timestamp ?? DateTime.now();

    List<Placemark> placemarks = await placemarkFromCoordinates(
        55.797048, 49.114148,
        localeIdentifier: 'ru');
    Placemark placemark = placemarks.first;
    double distanceToEvent = Geolocator.distanceBetween(
      55.797048,
      49.114148,
      widget.eventGeoPoint.latitude,
      widget.eventGeoPoint.longitude,
    );

    DateTime checkingDateTime;
    final bool isLeaving =
        currentTime.difference(widget.startDateTime).inMinutes > 30 ||
            _isCheckedAtStart;
    if (isLeaving) {
      checkingDateTime = widget.endDateTime;
    } else {
      checkingDateTime = widget.startDateTime;
    }

    return CurrentAttendanceItem(
      currentAddress:
          '${placemark.locality},${placemark.subLocality},${placemark.street!.isEmpty ? '${placemark.name}' : '${placemark.street}'}',
      distanceToEvent: distanceToEvent,
      minutesBetweenMarkTime: _getMinutesBefore(
          currentTime: currentTime, checkingDateTime: checkingDateTime),
      isLeaving: isLeaving,
      currentTime: currentTime,
    );
  }

  Future<void> _showFieldDescriptionDialog({
    required BuildContext context,
    required CurrentAttendanceItem attendanceItem,
    required String eventId,
  }) async {
    final String deviceToken;

    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      deviceToken = iosDeviceInfo.identifierForVendor!;
    } else {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      deviceToken = androidDeviceInfo.id;
    }

    if(context.mounted){
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return CurrentLocationDialog(
            isCorrectDevice: deviceToken == locator.get<UserState>().user!.device!.id,
            currentAddress: attendanceItem.currentAddress,
            minutesBetweenMarkTime: attendanceItem.minutesBetweenMarkTime,
            distanceToEvent: attendanceItem.distanceToEvent,
            currentTime: attendanceItem.currentTime,
            isLeaving: attendanceItem.isLeaving,
            eventId: eventId,
            onBtnPressed: () async {
              if (!_isCheckedAtStart) {
                _attendanceFuture = EventsRepositoryModule.eventsRepository()
                    .attendEvent(
                    eventId: eventId,
                    login: locator.get<UserState>().user!.login,
                    checkStartDateTime: !attendanceItem.isLeaving
                        ? attendanceItem.currentTime
                        : null,
                    checkEndDateTime: attendanceItem.isLeaving
                        ? attendanceItem.currentTime
                        : null);
              } else {
                _attendanceFuture = EventsRepositoryModule.eventsRepository()
                    .updateAttendance(
                    eventId: eventId,
                    login: locator.get<UserState>().user!.login,
                    checkStartDateTime: null,
                    checkEndDateTime: attendanceItem.isLeaving
                        ? attendanceItem.currentTime
                        : null);
              }
              setState(() {});
            },
          );
        },
      );
    }


  }

  int _getMinutesBefore({
    required DateTime currentTime,
    required DateTime checkingDateTime,
  }) {
    final int minutesBefore =
        checkingDateTime.difference(currentTime).inMinutes.toInt();
    return minutesBefore;
  }
}
