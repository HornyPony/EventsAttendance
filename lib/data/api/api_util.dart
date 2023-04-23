import 'package:events_attendance/data/api/model/api_attendance.dart';
import 'package:events_attendance/data/api/model/api_user.dart';
import 'package:events_attendance/data/api/request/attend_event.dart';
import 'package:events_attendance/data/api/request/firebase_user.dart';
import 'package:events_attendance/data/api/request/mobapp_login_body.dart';
import 'package:events_attendance/data/api/service/firebase_api.dart';
import 'package:events_attendance/data/api/service/kai_api.dart';
import 'package:events_attendance/data/mapper/attendance_mapper.dart';
import 'package:events_attendance/data/mapper/user_mapper.dart';
import 'package:events_attendance/domain/model/attendance_item.dart';
import 'package:events_attendance/domain/model/event_item.dart';
import 'package:events_attendance/domain/model/user.dart';

class ApiUtil {
  final KaiService kaiService;
  final FirebaseService firebaseService;

  ApiUtil({required this.kaiService, required this.firebaseService});

  Future<User> getUserInfo(
      {required String login, required String password}) async {
    final ApiUser apiUser = await kaiService.getUserInfo(
      userDataBody: UserDataBody(
        login: login,
        password: password,
      ),
      login: login,
    );
    return UserMapper.fromApi(apiUser);
  }

  ///FirebaseService

  Stream<List<EventItem>> readEvents({
    required String searchFieldText,
  }) {
    return firebaseService.readEvents(searchFieldText: searchFieldText);
  }

  Future<bool> getIsUserExists({required String login}) async {
    return firebaseService.getIsUserExists(
      login: login,
    );
  }

  Future<void> createFirebaseUser({
    required String login,
    required String deviceToken,
  }) async {
    await firebaseService.createUser(
        firebaseUserBody: FirebaseUserBody(
      login: login,
      deviceToken: deviceToken,
      authTime: DateTime.now(),
    ));
  }

  Future<AttendanceItem> attendEvent({
    required String eventId,
    required String login,
    required DateTime? checkStartDateTime,
    required DateTime? checkEndDateTime,
  }) async {
    final ApiAttendance apiAttendance = await firebaseService.attendEvent(
      attendEventBody: AttendEventBody(
          eventId: eventId,
          login: login,
          checkStartDateTime: checkStartDateTime,
          checkEndDateTime: checkEndDateTime),
    );

    return AttendanceMapper.fromApi(apiAttendance);
  }

  Future<AttendanceItem> updateAttendance({
    required String eventId,
    required String login,
    required DateTime? checkStartDateTime,
    required DateTime? checkEndDateTime,
  }) async {
    final ApiAttendance apiAttendance = await firebaseService.updateAttendance(
      attendEventBody: AttendEventBody(
          eventId: eventId,
          login: login,
          checkStartDateTime: checkStartDateTime,
          checkEndDateTime: checkEndDateTime),
    );

    return AttendanceMapper.fromApi(apiAttendance);
  }

  Future<AttendanceItem> checkAttendance({
    required String login,
    required String eventId,
  }) async {
    final ApiAttendance apiAttendance = await firebaseService.checkAttendance(
      login: login,
      eventId: eventId,
    );

    return AttendanceMapper.fromApi(apiAttendance);
  }
}
