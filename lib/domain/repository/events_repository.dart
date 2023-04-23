import 'package:events_attendance/domain/model/attendance_item.dart';
import 'package:events_attendance/domain/model/event_item.dart';

abstract class EventsRepository {
  Stream<List<EventItem>> readEvents({
    required String searchFieldText,
  });

  Future<AttendanceItem> attendEvent({
    required String eventId,
    required String login,
    required DateTime? checkStartDateTime,
    required DateTime? checkEndDateTime,
  });

  Future<AttendanceItem> updateAttendance({
    required String eventId,
    required String login,
    required DateTime? checkStartDateTime,
    required DateTime? checkEndDateTime,
  });

  Future<AttendanceItem> checkAttendance({
    required String login,
    required String eventId,
  });
}
