import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:events_attendance/presentation/navigator.dart';
import 'package:events_attendance/presentation/screens/events/events_screen.dart';
import 'package:events_attendance/presentation/screens/home/home_screen.dart';
import 'package:events_attendance/presentation/screens/profile/profile_screen.dart';

@CustomAutoRouter(
  durationInMilliseconds: CustomNavigationTransistor.durationInMilliseconds,
  transitionsBuilder: CustomNavigationTransistor.fade,
  replaceInRouteName: 'Screen,Route',
  routes: [
    AutoRoute(
      path: '/',
      page: HomeScreen,
      children: [
        AutoRoute(
          path: 'events',
          page: EmptyRouterPage,
          name: 'EventsScreen',
          children: [
            AutoRoute(
              path: '',
              page: EventsScreen,
              meta: {'noResizeToAvoidBottomInset': true},
            ),
          ],
        ),
        AutoRoute(
          path: 'profile',
          page: EmptyRouterPage,
          name: 'ProfileScreen',
          children: [
            AutoRoute(
              path: '',
              page: ProfileScreen,
              meta: {'noResizeToAvoidBottomInset': true},
            ),
          ],
        ),
      ],
    ),
  ],
)
class $AppRouter {}
