import 'package:events_attendance/presentation/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
