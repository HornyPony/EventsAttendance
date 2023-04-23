class CurrentAttendanceItem {
  final String currentAddress;
  final double distanceToEvent;
  final int minutesBetweenMarkTime;
  final DateTime currentTime;
  final bool isLeaving;

  CurrentAttendanceItem({
    required this.currentAddress,
    required this.distanceToEvent,
    required this.minutesBetweenMarkTime,
    required this.currentTime,
    required this.isLeaving,
  });
}
