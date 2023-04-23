
import 'package:events_attendance/domain/model/mobapp_user.dart';

abstract class MobappLoginRepository {
  Future<MobappUser> loginMobappUser({required String authToken});
}
