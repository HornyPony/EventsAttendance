import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:events_attendance/domain/model/user.dart';
import 'package:events_attendance/domain/model/user_shared_preferences.dart';
import 'package:events_attendance/generated/l10n.dart';
import 'package:events_attendance/internal/dependencies/firebase_user_repository_module.dart';
import 'package:events_attendance/internal/dependencies/get_user_repository_module.dart';
import 'package:events_attendance/presentation/global_widgets/action_btn.dart';
import 'package:events_attendance/presentation/global_widgets/expanded_scroll_view.dart';
import 'package:events_attendance/presentation/global_widgets/input_field_error_text.dart';
import 'package:events_attendance/presentation/router/router.gr.dart';
import 'package:events_attendance/presentation/screens/login/widgets/auth_text_fields.dart';
import 'package:events_attendance/presentation/utils/app_icons.dart';
import 'package:events_attendance/presentation/utils/constants.dart';
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
        body: CustomExpandedScrollView.customScrollView(
          child: Column(
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
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
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
                flex: 3,
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
  bool _isValidLoginPassword = true;

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
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 8.h,
              ),
              Form(
                key: _emailForm,
                child: EmailTextField(
                  controller: _usernameController,
                  isValid: _isValidLoginPassword,
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
                  isValid: _isValidLoginPassword,
                  toggleVisibility: _togglePasswordVisibility,
                ),
              ),
              if (!_isValidLoginPassword)
                InputFieldErrorText(
                  errorText: S.of(context).auth_error,
                  isBottomPadding: false,
                ),
            ],
          ),
        ),
        SafeArea(
          child: ActionBtn(
            onTap: () async {
              final String login = _getTrimmedString(_usernameController.text);
              final String password =
                  _getTrimmedString(_passwordController.text);

              final User user =
                  await GetUserRepositoryModule.getUserRepository().getUserInfo(
                login: login,
                password: password,
              );

              if (user.fio == Constants.nullStringValue) {
                setState(() {
                  _isValidLoginPassword = false;
                });
              } else {
                bool isUserExists =
                    await FirebaseUserRepositoryModule.getUserRepository()
                        .getIsUserExists(login: login);

                if (!isUserExists) {
                  final String deviceToken;
                  final String deviceName;

                  var deviceInfo = DeviceInfoPlugin();
                  if (Platform.isIOS) {
                    var iosDeviceInfo = await deviceInfo.iosInfo;
                    deviceToken = iosDeviceInfo.identifierForVendor!;
                    deviceName = iosDeviceInfo.name!;
                  } else {
                    var androidDeviceInfo = await deviceInfo.androidInfo;
                    deviceToken = androidDeviceInfo.id;
                    deviceName = androidDeviceInfo.model;
                  }

                  await FirebaseUserRepositoryModule.getUserRepository()
                      .createFirebaseUser(login: login, deviceToken: deviceToken, deviceName: deviceName,);
                }
                UserSharedPreferences.setUserLogin(login);
                UserSharedPreferences.setUserPassword(password);
                await User.setUser();

                if (context.mounted)
                  AutoRouter.of(context).replace(const HomeRoute());
              }


            },
            verticalPadding: 14,
            btnText: S.of(context).sign_in,
            prefixIcon: SvgPicture.asset(
              AppIcons.signIn,
              width: 14.w,
              height: 14.h,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  String _getTrimmedString(String text) {
    return text.trim();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isShowPassword = !_isShowPassword;
    });
  }
}
