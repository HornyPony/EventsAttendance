import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:events_attendance/domain/model/user.dart';
import 'package:events_attendance/domain/state/user_state.dart';
import 'package:events_attendance/generated/l10n.dart';
import 'package:events_attendance/get_it.dart';
import 'package:events_attendance/internal/dependencies/firebase_user_repository_module.dart';
import 'package:events_attendance/presentation/global_widgets/custom_divider.dart';
import 'package:events_attendance/presentation/utils/constants.dart';
import 'package:events_attendance/presentation/utils/dimensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        body: SafeArea(
          child: Observer(
            builder: (_) {
              final User user = locator.get<UserState>().user!;
              final daysAfterBindingDevice =
                  user.device!.bindingDate.difference(DateTime.now()).inDays.abs();


              return Column(
                children: [
                  _ProfileContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.fio,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                fontSize: 18.sp,
                              ),
                        ),
                        _getUserInfoTextIfExists(user.login, context),
                        _getUserInfoTextIfExists(
                            '${user.status.replaceAll(' ', '')} ${S.of(context).group_short}.${user.groupNumber.toString()} (${user.zachetkaNumber})',
                            context),
                        const CustomGreyDivider(),
                        _getUserInfoTextIfExists(user.instName, context),
                        _getUserInfoTextIfExists(user.kafName, context),
                        _getUserInfoTextIfExists(
                            '${user.specName}, ${user.specCode}', context),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  _ProfileContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).user_device,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                fontSize: 18.sp,
                              ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: '${user.device!.name} ',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                  fontSize: 16.sp,
                                ),
                            children: <TextSpan>[
                              if (daysAfterBindingDevice >= Constants.minDaysAfterDeviceBinding)
                                TextSpan(
                                  text: S.of(context).change,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {
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

                                      await FirebaseUserRepositoryModule
                                              .getUserRepository()
                                          .updateDevice(
                                        login: user.login,
                                        deviceToken: deviceToken,
                                        deviceName: deviceName,
                                      );

                                      User.setUser();


                                    },
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                        fontSize: 14.sp,
                                        decoration: TextDecoration.underline,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                ),
                            ],
                          ),
                        ),
                        if (daysAfterBindingDevice < Constants.minDaysAfterDeviceBinding)
                          Text(
                            '${S.of(context).rebind_after} ${Constants.minDaysAfterDeviceBinding - daysAfterBindingDevice} ${S.of(context).days_short}',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                  fontSize: 12.sp,
                                ),
                          ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _getUserInfoTextIfExists(String text, BuildContext context) {
    if (text.isNotEmpty) {
      return Text(
        text.trim(),
        style: Theme.of(context).textTheme.displayMedium!.copyWith(
              fontSize: 14.sp,
            ),
      );
    } else {
      return const SizedBox();
    }
  }
}

class _ProfileContainer extends StatelessWidget {
  final Widget child;

  const _ProfileContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(
          horizontal: CustomDimensions.screenHorizontalPadding),
      padding: EdgeInsets.symmetric(
        horizontal: CustomDimensions.screenHorizontalPadding,
        vertical: CustomDimensions.screenVerticalPadding,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10,
            spreadRadius: 0.0,
            offset: Offset(3.0, 3.0), // shadow direction: bottom right
          )
        ],
      ),
      child: child,
    );
  }
}
