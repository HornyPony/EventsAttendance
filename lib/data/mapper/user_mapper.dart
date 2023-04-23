import 'package:events_attendance/data/api/model/api_user.dart';
import 'package:events_attendance/domain/model/user.dart';

class UserMapper {
  static User fromApi(ApiUser apiUser) {
    return User(
      login: apiUser.userLogin,
      isAuthSuccess: apiUser.isAuthSuccess,
      fio: apiUser.fio,
      status: apiUser.status,
      groupNumber: apiUser.groupNumber,
      profileName: apiUser.profileName,
      specCode: apiUser.specCode,
      specName: apiUser.specName,
      instName: apiUser.instName,
      kafName: apiUser.kafName,
      zachetkaNumber: apiUser.zachetkaNumber,
    );
  }
}
