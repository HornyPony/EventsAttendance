import 'package:auto_route/auto_route.dart';
import 'package:events_attendance/presentation/global_widgets/custom_button.dart';
import 'package:events_attendance/presentation/global_widgets/event_status_container.dart';
import 'package:events_attendance/presentation/global_widgets/event_widgets.dart';
import 'package:events_attendance/presentation/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventContainer extends StatelessWidget {
  const EventContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap: () {
        AutoRouter.of(context).push(
          const EventSingleRoute(),
        );
      },
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 10.h,
      ),
      margin: EdgeInsets.only(
        top: 6.h,
      ),
      color: Colors.white,
      borderRadius: 16.r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EventWidgets.eventNameText(context),
          SizedBox(
            height: 6.h,
          ),
          EventWidgets.eventPlaceText(context),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              EventWidgets.eventDateText(context),
              const EventStatusContainer(),
            ],
          ),
        ],
      ),
    );
  }
}
