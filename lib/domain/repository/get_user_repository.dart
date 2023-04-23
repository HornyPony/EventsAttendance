import 'package:events_attendance/domain/model/user.dart';

abstract class GetUserRepository {
  Future<User> getUserInfo({required String login, required String password});
}
