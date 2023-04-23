import 'package:events_attendance/presentation/utils/map_keys.dart';

class ApiAttendance {
  late final bool isCheckedAtStart;
  late final bool isCheckedAtEnd;

  ApiAttendance.fromApi(Map<String, dynamic> map) {
    isCheckedAtStart = map[MapKeys.checkStartDateTime] != null ?? false;
    isCheckedAtEnd = map[MapKeys.checkEndDateTime] != null ?? false;
  }
}
