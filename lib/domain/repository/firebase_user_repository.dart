

import 'package:events_attendance/domain/model/device.dart';

abstract class FirebaseUserRepository {
  Future<void> createFirebaseUser({
    required String login,
    required String deviceToken,
    required String deviceName,
  });

  Future<bool> getIsUserExists({required String login});

  Future<Device> getUserDeviceInfo({required String login});

  Future<Device> updateDevice({
    required String login,
    required String deviceToken,
    required String deviceName,
  });
}
