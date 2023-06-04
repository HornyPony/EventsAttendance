import 'package:events_attendance/presentation/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventStatusContainer extends StatelessWidget {
  const EventStatusContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 6.w),
      padding: EdgeInsets.symmetric(
        vertical: 2.h,
        horizontal: 8.w,
      ),
      decoration: BoxDecoration(
        color: AppTheme.redColor,
        borderRadius: BorderRadius.circular(6.r,)
      ),
      child: Text(
        'Пройдено',
        style: Theme.of(context).textTheme.displaySmall!.copyWith(
          color: Colors.white,
          fontSize: 11.sp,
        ),
      ),
    );
  }
}
