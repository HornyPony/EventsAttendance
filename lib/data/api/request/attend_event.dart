


class AttendEventBody {
  final String eventId;
  final String login;
  final DateTime? checkStartDateTime;
  final DateTime? checkEndDateTime;

  AttendEventBody({
    required this.eventId,
    required this.login,
    required this.checkStartDateTime,
    required this.checkEndDateTime,
  });

  Map<String, dynamic> toApi() {
    return {
      "checkStartDateTime": checkStartDateTime,
      "checkEndDateTime": checkEndDateTime,
    };
  }
}
