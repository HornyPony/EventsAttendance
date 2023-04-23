import 'package:events_attendance/data/api/model/api_event.dart';
import 'package:events_attendance/domain/model/event_item.dart';

class EventMapper {
  static EventItem fromApi(ApiEvent apiEvent, String id,) {
    return EventItem(
      id: id,
      name: apiEvent.name,
      startDateTime: apiEvent.startDate,
      endDateTime: apiEvent.endDate,
      address: apiEvent.address,
      geoPoint: apiEvent.geoPoint,
      description: apiEvent.description,
    );
  }
}
