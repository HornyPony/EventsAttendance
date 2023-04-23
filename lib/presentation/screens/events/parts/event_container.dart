import 'package:auto_route/auto_route.dart';
import 'package:events_attendance/domain/model/event_item.dart';
import 'package:events_attendance/presentation/global_widgets/custom_button.dart';
import 'package:events_attendance/presentation/global_widgets/event_widgets.dart';
import 'package:events_attendance/presentation/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/global_functions.dart';

class EventContainer extends StatelessWidget {
  final EventItem eventItem;

  const EventContainer({
    Key? key,
    required this.eventItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap: () {
        AutoRouter.of(context).push(
          EventSingleRoute(
            eventItem: eventItem,
          ),
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
          EventWidgets.eventNameText(name: eventItem.name, context: context),
          SizedBox(
            height: 6.h,
          ),
          EventWidgets.eventPlaceText(
              location: eventItem.address, context: context),
          SizedBox(
            height: 10.h,
          ),
          EventWidgets.eventDateText(
              date:
                  '${GlobalFunctions.getFormattedDateString(eventItem.startDateTime)} - ${GlobalFunctions.getFormattedDateString(eventItem.endDateTime)}',
              context: context),
        ],
      ),
    );
  }
}
