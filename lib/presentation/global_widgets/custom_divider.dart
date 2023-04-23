import 'package:events_attendance/presentation/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGreyDivider extends StatelessWidget {
  const CustomGreyDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 8.h,
      thickness: 1.w,
      color: AppTheme.greyDividerColor,
    );
  }
}
