import 'package:events_attendance/generated/l10n.dart';
import 'package:events_attendance/presentation/global_widgets/action_btn.dart';

import 'package:events_attendance/presentation/screens/login/widgets/auth_text_fields.dart';
import 'package:events_attendance/presentation/utils/app_icons.dart';
import 'package:events_attendance/presentation/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        body: Column(
          children: [
            Flexible(
              flex: 4,
              child: Container(
                color: Theme.of(context).primaryColor,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 48.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SvgPicture.asset(
                        AppIcons.logo,
                        color: Colors.white,
                        width: 100.w,
                        height: 100.h,
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Text(
                        S.of(context).app_title,
                        textAlign: TextAlign.center,
                        style:
                            Theme.of(context).textTheme.displaySmall!.copyWith(
                                  fontSize: 24.sp,
                                  color: Colors.white,
                                ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(
                  horizontal: CustomDimensions.screenHorizontalPadding,
                ),
                child: const _AuthFieldsPart(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AuthFieldsPart extends StatefulWidget {
  const _AuthFieldsPart({Key? key}) : super(key: key);

  @override
  State<_AuthFieldsPart> createState() => _AuthFieldsPartState();
}

class _AuthFieldsPartState extends State<_AuthFieldsPart> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _emailForm = GlobalKey<FormState>();
  final _passwordForm = GlobalKey<FormState>();

  bool _isShowPassword = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Column(
          children: [
            Form(
              key: _emailForm,
              child: EmailTextField(
                controller: _usernameController,
                isValid: true,
                isShowErrorText: false,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Form(
              key: _passwordForm,
              child: PasswordTextField(
                controller: _passwordController,
                isShowPassword: _isShowPassword,
                isValid: true,
                toggleVisibility: _togglePasswordVisibility,
                validator: (_) {
                  return 'true'; /*Validators.passwordValidator(
                            _passwordController.text,
                          );*/
                },
              ),
            ),
          ],
        ),
        ActionBtn(
          onTap: () {},
          verticalPadding: 14,
          btnText: S.of(context).sign_in,
          prefixIcon: SvgPicture.asset(
            AppIcons.signIn,
            width: 14.w,
            height: 14.h,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isShowPassword = !_isShowPassword;
    });
  }
}
