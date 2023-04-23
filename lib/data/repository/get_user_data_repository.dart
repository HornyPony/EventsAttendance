import 'package:events_attendance/data/api/api_util.dart';
import 'package:events_attendance/domain/model/user.dart';
import 'package:events_attendance/domain/repository/get_user_repository.dart';

class GetUserDataRepository extends GetUserRepository {
  final ApiUtil _apiUtil;

  GetUserDataRepository(this._apiUtil);

  @override
  Future<User> getUserInfo({required String login, required String password}) {
    return _apiUtil.getUserInfo(login: login, password: password);
  }
}
