import 'package:auto_route/auto_route.dart';
import 'package:events_attendance/domain/state/user_state.dart';
import 'package:events_attendance/get_it.dart';
import 'package:events_attendance/presentation/router/router.gr.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (locator.get<UserState>().user != null) {
      router.replace(const HomeRoute());
    } else {
      resolver.next(true);
    }
  }
}
