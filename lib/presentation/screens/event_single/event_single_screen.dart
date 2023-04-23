import 'package:events_attendance/domain/model/event_item.dart';
import 'package:events_attendance/presentation/global_widgets/custom_appbars.dart';
import 'package:events_attendance/presentation/global_widgets/event_widgets.dart';
import 'package:events_attendance/presentation/screens/event_single/parts/mark_attendance_btn.dart';
import 'package:events_attendance/presentation/utils/app_icons.dart';
import 'package:events_attendance/presentation/utils/dimensions.dart';
import 'package:events_attendance/presentation/utils/global_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class EventSingleScreen extends StatelessWidget {
  final EventItem eventItem;

  const EventSingleScreen({
    Key? key,
    required this.eventItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        body: PseudoAppBarBackIconOnly(
          screenBody: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.r),
                        topRight: Radius.circular(16.r),
                      )),
                  padding: EdgeInsets.symmetric(
                    horizontal: CustomDimensions.screenHorizontalPadding,
                    vertical: CustomDimensions.screenVerticalPadding,
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: CustomDimensions.screenHorizontalPadding,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: EventWidgets.eventNameText(
                              name: eventItem.name, context: context),
                        ),
                        _InfoWithIconRow(
                          info: '${GlobalFunctions.getFormattedDateString(eventItem.startDateTime)}\n${GlobalFunctions.getFormattedDateString(eventItem.endDateTime)}',
                          svgIcon: SvgPicture.asset(
                            AppIcons.eventDate,
                            width: 14.w,
                            height: 14.h,
                          ),
                        ),
                        _InfoWithIconRow(
                          info: eventItem.address,
                          svgIcon: SvgPicture.asset(
                            AppIcons.eventPlace,
                            width: 10.w,
                            height: 14.h,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          eventItem.description,
                          textAlign: TextAlign.start,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                fontSize: 14.sp,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: MarkAttendanceBtn(
                  eventGeoPoint: eventItem.geoPoint,
                  startDateTime: eventItem.startDateTime,
                  endDateTime: eventItem.endDateTime,
                  eventId: eventItem.id,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoWithIconRow extends StatelessWidget {
  final SvgPicture svgIcon;
  final String info;

  const _InfoWithIconRow({
    Key? key,
    required this.svgIcon,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 6.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 16.w,
            height: 16.h,
            child: svgIcon,
          ),
          SizedBox(
            width: 6.w,
          ),
          Flexible(
              child: EventWidgets.eventPlaceText(
                  context: context, location: info)),
        ],
      ),
    );
  }
}
