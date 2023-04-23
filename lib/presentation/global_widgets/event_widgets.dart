import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class EventWidgets{
  static Widget eventNameText({required BuildContext context, required String name,}){
    return Text(
      name,
      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
        fontSize: 16.sp,
      ),
    );
  }

  static Widget eventPlaceText({required BuildContext context, required String location}){
    return Text(
      location,
      style: Theme.of(context).textTheme.displayLarge!.copyWith(
        fontSize: 12.sp,
      ),
    );
  }

  static Widget eventDateText({required BuildContext context, required String date,}){
    return Text(
      date,
      style: Theme.of(context).textTheme.displayLarge!.copyWith(
        fontSize: 11.sp,
      ),
    );
  }
}