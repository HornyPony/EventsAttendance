import 'package:events_attendance/generated/l10n.dart';
import 'package:events_attendance/presentation/screens/login/widgets/text_fields_styling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool isValid;
  final bool isShowErrorText;

  const EmailTextField({
    Key? key,
    required this.controller,
    required this.isValid,
    required this.isShowErrorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: isValid
          ? TextFieldsStyling.validInputBorder(context)
          : TextFieldsStyling.errorInputBorder(),
      child: TextFormField(
        controller: controller,
        style: Theme.of(context).textTheme.displayLarge!.copyWith(
          fontSize: 13.sp,
        ),
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        decoration: TextFieldsStyling.emailPromocodeFieldDecoration(
          hintText: S.of(context).auth_email,
          isShowErrorText: isShowErrorText,
          context: context,
        ),
        /*validator: FieldValidator.email(
          message: S.of(context).wrong_email_text,
        ),*/
      ),
    );
  }
}

class PasswordTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool isShowPassword;
  final bool isValid;
  final VoidCallback toggleVisibility;

  const PasswordTextField({
    Key? key,
    required this.controller,
    required this.isShowPassword,
    required this.isValid,
    required this.toggleVisibility,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: isValid
          ? TextFieldsStyling.validInputBorder(context)
          : TextFieldsStyling.errorInputBorder(),
      child: TextFormField(
        controller: controller,
        style: Theme.of(context).textTheme.displayLarge!.copyWith(
          fontSize: 16.sp,
        ),
        obscureText: !isShowPassword,
        keyboardType: TextInputType.visiblePassword,
        textInputAction:
        TextInputAction.done,
        decoration: TextFieldsStyling.passwordTextFieldDecoration(
          hintText: S.of(context).auth_password,
          isShowPassword: isShowPassword,
          toggleVisibility: toggleVisibility,
          context: context,
        ),
      ),
    );
  }
}
