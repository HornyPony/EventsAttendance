import 'package:events_attendance/presentation/global_widgets/custom_appbars.dart';
import 'package:events_attendance/presentation/global_widgets/event_status_container.dart';
import 'package:events_attendance/presentation/global_widgets/event_widgets.dart';
import 'package:events_attendance/presentation/screens/event_single/parts/mark_attendance_btn.dart';
import 'package:events_attendance/presentation/utils/app_icons.dart';
import 'package:events_attendance/presentation/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class EventSingleScreen extends StatelessWidget {
  const EventSingleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        body: PseudoAppBarBackIconOnly(
          screenBody: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.r),
                        topRight: Radius.circular(16.r),
                      )),
                  padding: EdgeInsets.symmetric(
                    horizontal: CustomDimensions.screenHorizontalPadding,
                    vertical: CustomDimensions.screenVerticalPadding,
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: CustomDimensions.screenHorizontalPadding,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(child: EventWidgets.eventNameText(context),),
                            const EventStatusContainer(),
                          ],
                        ),

                        _InfoWithIconRow(
                          infoString: 'infoString',
                          svgIcon: SvgPicture.asset(
                            AppIcons.eventDate,
                            width: 14.w,
                            height: 14.h,
                          ),
                        ),
                        _InfoWithIconRow(
                          infoString: 'infoString',
                          svgIcon: SvgPicture.asset(
                            AppIcons.eventPlace,
                            width: 10.w,
                            height: 14.h,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          'В день рождения университета, 5 марта в 12:00 на площади КСК «КАИ Олимп» (ул.Чистопольская, 65а), КАИсты соберутся на «Спортивный день». Для студентов и коллектива пройдет юбилейный флешмоб «КАИ 90», «шоу дронов», спортивные состязания, конкурс «Мисс Весна», кроме того, на площадке будет работать зона КАИ-арт, где любой желающий сможет оставить пожелания вузу.',
                          style:
                              Theme.of(context).textTheme.displayLarge!.copyWith(
                                    fontSize: 14.sp,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: MarkAttendanceBtn(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoWithIconRow extends StatelessWidget {
  final SvgPicture svgIcon;
  final String infoString;

  const _InfoWithIconRow({
    Key? key,
    required this.infoString,
    required this.svgIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 6.h),
      child: Row(
        children: [
          SizedBox(
            width: 16.w,
            height: 16.h,
            child: svgIcon,
          ),
          SizedBox(
            width: 6.w,
          ),
          Flexible(child: EventWidgets.eventPlaceText(context)),
        ],
      ),
    );
  }
}
