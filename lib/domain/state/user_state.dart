
import 'package:events_attendance/domain/model/user.dart';
import 'package:mobx/mobx.dart';

part 'user_state.g.dart';

class UserState = UserStateBase with _$UserState;

abstract class UserStateBase with Store {
  @observable
  User? user;

  @action
  void setUser(User user) {
    this.user = user;
  }
}
