import 'package:events_attendance/presentation/global_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarkAttendanceBtn extends StatelessWidget {
  const MarkAttendanceBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap: () {},
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
        child: Text(
          'Я пришел',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                fontSize: 14.sp,
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}
