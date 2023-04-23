import 'package:events_attendance/domain/state/user_state.dart';
import 'package:get_it/get_it.dart';



final locator = GetIt.instance;

void setupGetItLocator() {
  locator.registerLazySingleton<UserState>(() => UserState());
}
