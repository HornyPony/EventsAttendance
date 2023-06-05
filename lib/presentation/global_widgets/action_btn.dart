import 'package:events_attendance/presentation/global_widgets/custom_button.dart';
import 'package:events_attendance/presentation/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActionBtn extends StatelessWidget {
  final VoidCallback onTap;
  final String btnText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isFilled;
  final int verticalPadding;
  final double? width;
  final bool isActionBtnDisabled;

  const ActionBtn(
      {Key? key,
        required this.onTap,
        required this.btnText,
        this.prefixIcon,
        this.suffixIcon,
        this.width,
        this.isFilled = true,
        this.isActionBtnDisabled = false,
        this.verticalPadding = 12})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap: onTap,
      child: Container(
        width: width,

        padding: EdgeInsets.symmetric(
          vertical: verticalPadding.h,
          horizontal: 25.w,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: _getBtnColor(),
          border: !isFilled ? Border.all(
            color: AppTheme.primaryColor,
          ) : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            prefixIcon != null
                ? Padding(
              child: prefixIcon,
              padding: EdgeInsets.only(right: 8.w),
            )
                : const SizedBox(),
            Flexible(
              child: Text(
                btnText,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontSize: 14.sp,
                  color: isFilled ? Colors.white : AppTheme.primaryColor,
                ),
              ),
            ),
            suffixIcon != null
                ? Padding(
              child: suffixIcon,
              padding: EdgeInsets.only(left: 8.w),
            )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  Color _getBtnColor(){
    if(isFilled){
      if (isActionBtnDisabled){
        return AppTheme.disabledActionBtnColor;
      } else {
        return AppTheme.primaryColor;
      }
    } else{
      return Colors.transparent;
    }
  }
}
