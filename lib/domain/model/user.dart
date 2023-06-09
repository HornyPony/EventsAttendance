import 'package:events_attendance/domain/model/device.dart';
import 'package:events_attendance/domain/model/user_shared_preferences.dart';
import 'package:events_attendance/domain/state/user_state.dart';
import 'package:events_attendance/get_it.dart';
import 'package:events_attendance/internal/dependencies/firebase_user_repository_module.dart';
import 'package:events_attendance/internal/dependencies/get_user_repository_module.dart';

class User {
  final String login;
  final bool isAuthSuccess;
  final String fio;
  final String status;
  final int groupNumber;
  final String profileName;
  final String specCode;
  final String specName;
  final String instName;
  final String kafName;
  final String zachetkaNumber;
  Device? device;

  User({
    required this.login,
    required this.isAuthSuccess,
    required this.fio,
    required this.status,
    required this.groupNumber,
    required this.profileName,
    required this.specCode,
    required this.specName,
    required this.instName,
    required this.kafName,
    required this.zachetkaNumber,
    this.device,
  });

  static Future<void> setUser() async {
    String savedUserLogin = UserSharedPreferences.getSavedUserLogin();
    String savedUserPassword = UserSharedPreferences.getSavedUserPassword();

    if (savedUserLogin.isNotEmpty && savedUserPassword.isNotEmpty) {
      User? user = await GetUserRepositoryModule.getUserRepository().getUserInfo(
        login: savedUserLogin,
        password: savedUserPassword,
      );
      try{
        Device userDevice = await FirebaseUserRepositoryModule.getUserRepository()
            .getUserDeviceInfo(login: user.login);
        user.device = userDevice;
        locator.get<UserState>().setUser(user);
      } catch (e){
        user = null;
      }


    }
  }
}
