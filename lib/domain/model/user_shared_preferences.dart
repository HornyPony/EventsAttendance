import 'package:events_attendance/presentation/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreferences {
  static late final SharedPreferences _sharedPreferences;

  static const String _keyLogin = 'userLogin';
  static const String _keyPassword = 'userPassword';

  static Future init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  ///User
  static Future<void> setUserLogin(String login) async {
    await _sharedPreferences.setString(_keyLogin, login);
  }

  static String getSavedUserLogin() {
    return _sharedPreferences.getString(_keyLogin) ?? Constants.nullStringValue;
  }

  static Future<void> setUserPassword(String password) async {
    await _sharedPreferences.setString(_keyPassword, password);
  }

  static String getSavedUserPassword() {
    return _sharedPreferences.getString(_keyPassword) ??
        Constants.nullStringValue;
  }

  static Future<void> removeSavedAuthorizedUser() async {
    await _sharedPreferences.remove(_keyLogin);
    await _sharedPreferences.remove(_keyPassword);
  }
}
