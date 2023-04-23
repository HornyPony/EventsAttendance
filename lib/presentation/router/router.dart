import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:events_attendance/presentation/navigator.dart';
import 'package:events_attendance/presentation/router/auth_guard.dart';
import 'package:events_attendance/presentation/screens/event_single/event_single_screen.dart';
import 'package:events_attendance/presentation/screens/events/events_screen.dart';
import 'package:events_attendance/presentation/screens/home/home_screen.dart';
import 'package:events_attendance/presentation/screens/login/login_screen.dart';
import 'package:events_attendance/presentation/screens/profile/profile_screen.dart';

@CustomAutoRouter(
  durationInMilliseconds: CustomNavigationTransistor.durationInMilliseconds,
  transitionsBuilder: CustomNavigationTransistor.fade,
  replaceInRouteName: 'Screen,Route',
  routes: [
    AutoRoute(
      path: '/',
      page: LoginScreen,
      guards: [AuthGuard]
    ),
    AutoRoute(
      path: 'home_screen',
      page: HomeScreen,
      children: [
        AutoRoute(
          path: 'events',
          name: 'EventsRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              page: EventsScreen,
              meta: {'noResizeToAvoidBottomInset': true},
            ),
            AutoRoute(
              path: 'event_single',
              page: EventSingleScreen,
            ),
          ],
        ),
        AutoRoute(
          path: 'profile',
          page: ProfileScreen,
          meta: {'noResizeToAvoidBottomInset': true},
        ),
      ],
    ),
  ],
)
class $AppRouter {}
