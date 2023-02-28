import 'package:events_attendance/generated/l10n.dart';
import 'package:events_attendance/presentation/global_widgets/custom_button.dart';
import 'package:events_attendance/presentation/utils/app_icons.dart';
import 'package:events_attendance/presentation/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

abstract class TextFieldsStyling {
  static InputDecoration emailPromocodeFieldDecoration({
    required String hintText,
    required bool isShowErrorText,
    required BuildContext context,
  }) {
    return InputDecoration(
      contentPadding: _textFieldContentPadding(),
      errorStyle: isShowErrorText
          ? TextStyle(
        color: Colors.red[700],
        fontSize: 12,
      )
          : _noShowErrorTextStyle(),
      labelText: hintText,
      labelStyle: Theme.of(context).textTheme.bodyLarge,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      focusedErrorBorder: InputBorder.none,
    );
  }

  static InputDecoration passwordTextFieldDecoration({
    required String hintText,
    required bool isShowPassword,
    required VoidCallback toggleVisibility,
    required BuildContext context,
  }) {
    return InputDecoration(
      contentPadding: _textFieldContentPadding(),
      errorStyle: _noShowErrorTextStyle(),
      labelText: hintText,
      labelStyle: Theme.of(context).textTheme.bodyLarge,
      suffixIconConstraints: BoxConstraints(minWidth: 48.w),
      suffixIcon: GestureDetector(
        onTap: toggleVisibility,
        behavior: HitTestBehavior.translucent,
        child: Icon(
          isShowPassword
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
          color: Theme.of(context).primaryColor,
          size: 20.w < 20.h ? 20.w : 20.h,
        ),
      ),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      focusedErrorBorder: InputBorder.none,
    );
  }

  static InputDecoration searchFieldDecoration({
    required BuildContext context,
    required TextEditingController controller,
    required VoidCallback onClearPressed,
  }) {
    return InputDecoration(
      filled: true,
      isDense: true,
      fillColor: AppTheme.searchTextFieldColor,
      hintText: S.of(context).search_events_hint_text,
      hintStyle: Theme.of(context).textTheme.displayLarge!.copyWith(
        color: AppTheme.searchTextFieldIconTextColor,
        overflow: TextOverflow.clip,
        fontSize: 14.sp,
      ),

      suffixIcon: controller.text.isNotEmpty
          ? CustomButton(
        onTap: () {
          controller.clear();
          onClearPressed();
        },
        child: SvgPicture.asset(
          AppIcons.closeCross,
          width: 10.33.w,
          height: 10.33.h,
          color: Theme.of(context).colorScheme.secondary,
        ),
      )
          : null,
      suffixIconConstraints: BoxConstraints(
        minWidth: 40.w,
        minHeight: 10.33.h,
      ),
      contentPadding: EdgeInsets.only(
        top: 10.h,
        bottom: 10.h,
        left: 10.w,
        //horizontal: 18.w,
      ),
      enabledBorder: _searchFieldBorder(),
      focusedErrorBorder: _searchFieldBorder(),
      focusedBorder: _searchFieldBorder(),
      errorBorder: _searchFieldBorder(),
    );
  }

  static EdgeInsets _textFieldContentPadding() {
    return EdgeInsets.symmetric(
      vertical: 11.h,
      horizontal: 18.w,
    );
  }

  static BoxDecoration validInputBorder(BuildContext context) {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.r),
      border: Border.all(
        color: Theme.of(context).primaryColor,
        width: 1.w,
      ),
    );
  }

  static BoxDecoration errorInputBorder() {
    return BoxDecoration(
      color: AppTheme.lightRedErrorColor,
      borderRadius: BorderRadius.circular(10.r),
      border: Border.all(
        color: AppTheme.redErrorColor,
        width: 1.w,
      ),
    );
  }

  static BoxDecoration validPromocodeInputBorder() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.r),
      border: Border.all(
        color: AppTheme.greyBorderColor,
        width: 1.w,
      ),
    );
  }

  static BoxDecoration errorPromocodeInputBorder() {
    return BoxDecoration(
      color: AppTheme.lightRedErrorColor,
      borderRadius: BorderRadius.circular(10.r),
      border: Border.all(
        color: AppTheme.redErrorColor,
        width: 1.w,
      ),
    );
  }

  static TextStyle _noShowErrorTextStyle() {
    return const TextStyle(
      height: 0.1,
      fontSize: 0,
      color: Colors.transparent,
    );
  }

  static OutlineInputBorder _searchFieldBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(
        color: AppTheme.searchTextFieldColor,
        width: 1.w,
      ),
    );
  }
}
