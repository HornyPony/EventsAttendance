import 'package:events_attendance/domain/model/user.dart';
import 'package:events_attendance/domain/state/user_state.dart';
import 'package:events_attendance/get_it.dart';
import 'package:events_attendance/presentation/global_widgets/custom_divider.dart';
import 'package:events_attendance/presentation/utils/dimensions.dart';
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
        body: SafeArea(child: Observer(
          builder: (_) {
            final User user = locator.get<UserState>().user!;
            return Column(
              children: [
                Container(
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
                        offset:
                            Offset(3.0, 3.0), // shadow direction: bottom right
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.fio,
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  fontSize: 18.sp,
                                ),
                      ),
                      _getUserInfoTextIfExists(user.login, context),
                      _getUserInfoTextIfExists(
                          '${user.status.replaceAll(' ', '')} гр.${user.groupNumber.toString()} (${user.zachetkaNumber})',
                          context),
                      const CustomGreyDivider(),
                      _getUserInfoTextIfExists(user.instName, context),
                      _getUserInfoTextIfExists(user.kafName, context),
                      _getUserInfoTextIfExists(
                          '${user.specName} - ${user.specCode}', context),

                    ],
                  ),
                )
              ],
            );
          },
        )),
      ),
    );
  }

  Widget _getUserInfoTextIfExists(String text, BuildContext context) {
    print(text);
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
