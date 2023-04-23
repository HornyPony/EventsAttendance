import 'package:auto_route/auto_route.dart';
import 'package:events_attendance/presentation/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrentLocationDialog extends StatelessWidget {
  final String currentAddress;
  final int minutesBetweenMarkTime;
  final bool isLeaving;
  final double distanceToEvent;
  final String eventId;
  final DateTime currentTime;
  final Future<void> Function() onBtnPressed;

  const CurrentLocationDialog({
    Key? key,
    required this.currentAddress,
    required this.minutesBetweenMarkTime,
    required this.distanceToEvent,
    required this.eventId,
    required this.currentTime,
    required this.onBtnPressed,
    required this.isLeaving,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isUserFarFromEvent = distanceToEvent > 50;
    final bool isLate = !isLeaving && minutesBetweenMarkTime < -30;
    final bool isEarly = minutesBetweenMarkTime > 30;

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
                      _getTitle(),
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            fontSize: 20.sp,
                            color: Theme.of(context).primaryColor,
                            decoration: TextDecoration.underline,
                          ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    _getText(
                      title: 'Вы находитесь здесь:',
                      info: currentAddress,
                      context: context,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    _getText(
                      title: 'Расстояние до мероприятия:',
                      info:
                          '${distanceToEvent.toStringAsFixed(2.truncateToDouble() == 2 ? 0 : 1)} м',
                      context: context,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    _getText(
                      title: _getTimeBetweenMarkTimeTitle(
                          minutesBetweenMarkTime, isLeaving),
                      info: _getFormattedTimeBetweenMarkTime(
                          minutesBetweenMarkTime),
                      context: context,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isUserFarFromEvent || isLate || isEarly
                      ? null
                      : () async {
                          await onBtnPressed();
                          AutoRouter.of(context).pop();
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
                    ),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontSize: 14.sp,
                          color: isUserFarFromEvent || isEarly
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

  Widget _getText(
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

  String _getTitle() {
    String title = Constants.nullStringValue;

    if (isLeaving) {
      title = 'Отметка об уходе';
    } else {
      title = 'Отметка о приходе';
    }

    return title.toUpperCase();
  }

  String _getBtnText({
    required bool isUserFarFromEvent,
    required bool isEarly,
  }) {
    print(minutesBetweenMarkTime);
    String btnText = '';
    if (isUserFarFromEvent) {
      btnText = 'Вы находитесь далеко от мероприятия';
    } else if (isEarly) {
      btnText = 'Подождите еще ${minutesBetweenMarkTime.abs() - 30} мин.';
    } else {
      if (isLeaving) {
        btnText = 'Я ухожу';
      } else {
        btnText = 'Я пришел';
      }
    }
    return btnText;
  }

  String _getTimeBetweenMarkTimeTitle(
      int minutesBetweenMarkTime, bool isLeaving) {
    String title = '';
    if (isLeaving) {
      if (!minutesBetweenMarkTime.isNegative) {
        title = 'Вы уходите раньше на:';
      } else {
        title = 'Вы задержались на:';
      }
    } else {
      if (minutesBetweenMarkTime.isNegative) {
        title = 'Вы опоздали на:';
      } else {
        title = 'До начала мероприятия:';
      }
    }

    return title;
  }

  String _getFormattedTimeBetweenMarkTime(int minutesBetweenMarkTime) {
    String timeBetweenMarkTime = '';

    final int minutesBetweenMarkTimeAbs = minutesBetweenMarkTime.abs();

    if (minutesBetweenMarkTimeAbs >= 1440) {
      timeBetweenMarkTime = '${minutesBetweenMarkTimeAbs ~/ 1440} дн.';
    } else if (minutesBetweenMarkTimeAbs >= 60) {
      timeBetweenMarkTime = '${minutesBetweenMarkTimeAbs ~/ 60} ч.';
    } else {
      timeBetweenMarkTime = '$minutesBetweenMarkTimeAbs мин.';
    }

    return timeBetweenMarkTime;
  }
}
