import 'package:events_attendance/presentation/utils/app_icons.dart';
import 'package:events_attendance/presentation/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InputFieldErrorText extends StatelessWidget {
  final String errorText;
  final bool isBottomPadding;

  const InputFieldErrorText({
    Key? key,
    required this.errorText,
     this.isBottomPadding = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: isBottomPadding ? 0 : 8.h,
        bottom: isBottomPadding ? 8.h : 0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            AppIcons.textfieldError,
            width: 16.w,
            height: 16.h,
            color: AppTheme.redErrorColor,
          ),
          Flexible(
            child: Row(
              children: [
                SizedBox(
                  width: 8.w,
                ),
                Flexible(
                  child: Text(
                    errorText,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: AppTheme.redErrorColor,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
