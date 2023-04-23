import 'package:events_attendance/data/api/model/api_attendance.dart';
import 'package:events_attendance/domain/model/attendance_item.dart';


class AttendanceMapper {
  static AttendanceItem fromApi(ApiAttendance apiAttendance) {
    return AttendanceItem(
      isCheckedAtStart: apiAttendance.isCheckedAtStart,
      isCheckedAtEnd: apiAttendance.isCheckedAtEnd,
    );
  }
}
