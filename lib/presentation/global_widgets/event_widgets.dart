import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class EventWidgets{
  static Widget eventNameText(BuildContext context){
    return Text(
      'День рождения КАИ День рождения КАИДень рождения КАИ',
      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
        fontSize: 16.sp,
      ),
    );
  }

  static Widget eventPlaceText(BuildContext context){
    return Text(
      'КСК «КАИ ОЛИМП» - Чистопольская, 65А Чистопольская, 65А Чистопольская, 65А',
      style: Theme.of(context).textTheme.displayLarge!.copyWith(
        fontSize: 12.sp,
      ),
    );
  }

  static Widget eventDateText(BuildContext context){
    return Text(
      '02.03.2023, 10:00',
      style: Theme.of(context).textTheme.displayLarge!.copyWith(
        fontSize: 11.sp,
      ),
    );
  }
}