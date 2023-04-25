import 'package:auto_route/auto_route.dart';
import 'package:events_attendance/domain/state/user_state.dart';
import 'package:events_attendance/generated/l10n.dart';
import 'package:events_attendance/get_it.dart';
import 'package:events_attendance/presentation/router/router.gr.dart';
import 'package:events_attendance/presentation/utils/app_icons.dart';
import 'package:events_attendance/presentation/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool hideBottomNavConfigInRouter =
        context.topRouteMatch.meta['hideBottomNav'] == true;
    final bool noResizeToAvoidBottomInset =
        context.topRouteMatch.meta['noResizeToAvoidBottomInset'] == false;

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
          textScaleFactor:
              MediaQuery.of(context).textScaleFactor.clamp(1.0, 1.2)),
      child: AutoTabsScaffold(
        routes: const [
          EventsRouter(),
          ProfileRoute()
        ],
        resizeToAvoidBottomInset: noResizeToAvoidBottomInset,
        bottomNavigationBuilder: !hideBottomNavConfigInRouter
            ? (_, tabsRouter) {
                return Theme(
                  data: AppTheme.lightTheme().copyWith(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  child: BottomNavigationBar(
                    onTap: (int index) {
                      if(locator.get<UserState>().user != null){
                        tabsRouter.setActiveIndex(index);

                      }
                    },
                    currentIndex: tabsRouter.activeIndex,
                    selectedItemColor: Theme.of(context).primaryColor,
                    unselectedItemColor:
                        AppTheme.unselectedBottomNavigationBarItemColor,
                    selectedLabelStyle: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(
                            fontSize: 10.sp,
                            color: Theme.of(context).primaryColor),
                    unselectedLabelStyle: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(
                            fontSize: 10.sp,
                            color: AppTheme
                                .unselectedBottomNavigationBarItemColor),
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: Colors.white,
                    showUnselectedLabels: true,
                    items: [
                      BottomNavigationBarItem(
                        icon: _getBottomNavImage(
                          icon: AppIcons.events,
                          navBarItemIndex: 0,
                          selectedPageIndex: tabsRouter.activeIndex,
                          context: context,
                        ),
                        tooltip: '',
                        label: S.of(context).events,
                      ),
                      BottomNavigationBarItem(
                        icon: _getBottomNavImage(
                          icon: AppIcons.profile,
                          navBarItemIndex: 1,
                          selectedPageIndex: tabsRouter.activeIndex,
                          context: context,
                        ),
                        tooltip: '',
                        label: S.of(context).profile,
                      ),
                    ],
                  ),
                );
              }
            : null,
      ),
    );
  }

  Widget _getBottomNavImage({
    required String icon,
    required int navBarItemIndex,
    required int selectedPageIndex,
    required BuildContext context,
  }) {
    return SvgPicture.asset(
      icon,
      alignment: Alignment.center,
      width: 21.w,
      height: 21.h,
      color: _getIconColor(navBarItemIndex, selectedPageIndex, context),
    );
  }

  Color _getIconColor(
      int navBarItemIndex, int selectedPageIndex, BuildContext context) {
    if (navBarItemIndex == selectedPageIndex) {
      return Theme.of(context).primaryColor;
    } else {
      return AppTheme.unselectedBottomNavigationBarItemColor;
    }
  }
}
