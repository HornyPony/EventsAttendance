import 'package:auto_route/auto_route.dart';
import 'package:events_attendance/generated/l10n.dart';
import 'package:events_attendance/presentation/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrentLocationDialog extends StatelessWidget {
  final String currentAddress;
  final int minutesBetweenMarkTime;
  final bool isLeaving;
  final bool isCorrectDevice;
  final double distanceToEvent;
  final String eventId;
  final DateTime currentTime;
  final Future<void> Function() onBtnPressed;

  const CurrentLocationDialog({
    Key? key,
    required this.currentAddress,
    required this.minutesBetweenMarkTime,
    required this.isCorrectDevice,
    required this.distanceToEvent,
    required this.eventId,
    required this.currentTime,
    required this.onBtnPressed,
    required this.isLeaving,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isUserFarFromEvent = distanceToEvent > 50;
    final bool isLate = minutesBetweenMarkTime < -30;
    final bool isEarly = minutesBetweenMarkTime > 30;

    print(minutesBetweenMarkTime);

    return Dialog(
      insetPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 290.w,
            minHeight: 100.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.w,
                  vertical: 22.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _getTitle(context),
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            fontSize: 20.sp,
                            color: Theme.of(context).primaryColor,
                            decoration: TextDecoration.underline,
                          ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    _getSectionText(
                      title: S.of(context).user_location,
                      info: currentAddress,
                      context: context,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    _getSectionText(
                      title: S.of(context).event_distance,
                      info:
                          '${distanceToEvent.toStringAsFixed(2.truncateToDouble() == 2 ? 0 : 1)} ${S.of(context).meter_short}',
                      context: context,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    _getSectionText(
                      title: _getTimeBetweenMarkTimeTitle(
                          minutesBetweenMarkTime, isLeaving, context),
                      info: _getFormattedTimeBetweenMarkTime(
                          minutesBetweenMarkTime, context),
                      context: context,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isUserFarFromEvent || isLate || isEarly || !isCorrectDevice
                      ? null
                      : () async {
                          await onBtnPressed();
                          if(context.mounted){
                            AutoRouter.of(context).pop();
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      vertical: 12.h,
                      horizontal: 8.w,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16.r),
                        topLeft: Radius.circular(16.r),
                      ),
                    ),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  child: Text(
                    _getBtnText(
                      isUserFarFromEvent: isUserFarFromEvent,
                      isEarly: isEarly,
                      isLate: isLate,
                      context: context,
                    ),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontSize: 14.sp,
                          color: isUserFarFromEvent || isEarly || !isCorrectDevice || isLate
                              ? Theme.of(context).colorScheme.secondary
                              : Colors.white,
                        ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _getSectionText(
      {required String title,
      required String info,
      required BuildContext context}) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
              text: '$title\n',
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    fontSize: 16.sp,
                    color: Theme.of(context).primaryColor,
                  )),
          TextSpan(
              text: info,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontSize: 16.sp,
                  )),
        ],
      ),
    );
  }

  String _getTitle(BuildContext context) {
    String title = Constants.nullStringValue;

    if (isLeaving) {
      title = S.of(context).mark_leave;
    } else {
      title = S.of(context).mark_visit;
    }

    return title.toUpperCase();
  }

  String _getBtnText({
    required bool isUserFarFromEvent,
    required bool isEarly,
    required bool isLate,
    required BuildContext context,

  }) {
    String btnText = '';
    if (!isCorrectDevice) {
      btnText = S.of(context).check_in_from_ur_device;
    } else if (isUserFarFromEvent) {
      btnText = S.of(context).long_distance;
    } else if (isEarly) {
      btnText =
          '${S.of(context).wait} ${minutesBetweenMarkTime.abs() - 30} ${S.of(context).minutes_short}';
    } else if (isLate) {
      btnText = '${S.of(context).user_visit_late} ${minutesBetweenMarkTime.abs() - 30} ${S.of(context).minutes_short}';
    } else {
      if (isLeaving) {
        btnText = S.of(context).user_leave;
      } else {
        btnText = S.of(context).user_visit;
      }
    }
    return btnText;
  }

  String _getTimeBetweenMarkTimeTitle(
      int minutesBetweenMarkTime, bool isLeaving, BuildContext context) {
    String title = '';
    if (isLeaving) {
      if (!minutesBetweenMarkTime.isNegative) {
        title = S.of(context).user_leave_early;
      } else {
        title = S.of(context).user_leave_late;
      }
    } else {
      if (minutesBetweenMarkTime.isNegative) {
        title = S.of(context).user_visit_late;
      } else {
        title = S.of(context).user_visit_early;
      }
    }

    return title;
  }

  String _getFormattedTimeBetweenMarkTime(
    int minutesBetweenMarkTime,
    BuildContext context,
  ) {
    String timeBetweenMarkTime = '';

    final int minutesBetweenMarkTimeAbs = minutesBetweenMarkTime.abs();

    if (minutesBetweenMarkTimeAbs >= 1440) {
      timeBetweenMarkTime =
          '${minutesBetweenMarkTimeAbs ~/ 1440} ${S.of(context).days_short}';
    } else if (minutesBetweenMarkTimeAbs >= 60) {
      timeBetweenMarkTime =
          '${minutesBetweenMarkTimeAbs ~/ 60} ${S.of(context).hours_short}';
    } else {
      timeBetweenMarkTime =
          '$minutesBetweenMarkTimeAbs ${S.of(context).minutes_short}';
    }

    return timeBetweenMarkTime;
  }
}
