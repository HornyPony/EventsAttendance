import 'package:events_attendance/data/api/api_util.dart';
import 'package:events_attendance/domain/model/attendance_item.dart';
import 'package:events_attendance/domain/model/event_item.dart';
import 'package:events_attendance/domain/repository/events_repository.dart';

class EventsDataRepository extends EventsRepository {
  final ApiUtil _apiUtil;

  EventsDataRepository(this._apiUtil);

  @override
  Stream<List<EventItem>> readEvents({required String searchFieldText}) {
    return _apiUtil.readEvents(searchFieldText: searchFieldText);
  }

  @override
  Future<AttendanceItem> attendEvent(
      {required String eventId,
        required String login,
        required DateTime? checkStartDateTime,
        required DateTime? checkEndDateTime}) {
    return _apiUtil.attendEvent(
        eventId: eventId,
        login: login,
        checkStartDateTime: checkStartDateTime,
        checkEndDateTime: checkEndDateTime);
  }

  @override
  Future<AttendanceItem> updateAttendance({required String eventId, required String login, required DateTime? checkStartDateTime, required DateTime? checkEndDateTime}) {
    return _apiUtil.updateAttendance(
        eventId: eventId,
        login: login,
        checkStartDateTime: checkStartDateTime,
        checkEndDateTime: checkEndDateTime);
  }

  @override
  Future<AttendanceItem> checkAttendance({required String login, required String eventId}) {
    return _apiUtil.checkAttendance(login: login, eventId: eventId);
  }


}
