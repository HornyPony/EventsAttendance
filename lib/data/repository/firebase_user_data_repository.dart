import 'package:events_attendance/data/api/api_util.dart';
import 'package:events_attendance/domain/model/device.dart';
import 'package:events_attendance/domain/repository/firebase_user_repository.dart';

class FirebaseUserDataRepository extends FirebaseUserRepository {
  final ApiUtil _apiUtil;

  FirebaseUserDataRepository(this._apiUtil);

  @override
  Future<void> createFirebaseUser({
    required String login,
    required String deviceToken,
    required String deviceName,
  }) {
    return _apiUtil.createFirebaseUser(
      login: login,
      deviceToken: deviceToken,
      deviceName: deviceName,
    );
  }

  @override
  Future<bool> getIsUserExists({required String login}) {
    return _apiUtil.getIsUserExists(login: login);
  }

  @override
  Future<Device> getUserDeviceInfo({required String login}) {
    return _apiUtil.getUserDeviceInfo(login: login);
  }

  @override
  Future<Device> updateDevice({required String login,
    required String deviceToken,
    required String deviceName}) {
    return _apiUtil.updateDevice(
        login: login, deviceToken: deviceToken, deviceName: deviceName);
  }
}
