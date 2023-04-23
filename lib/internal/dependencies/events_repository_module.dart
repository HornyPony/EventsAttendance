import 'package:events_attendance/data/repository/events_data_repository.dart';
import 'package:events_attendance/domain/repository/events_repository.dart';
import 'package:events_attendance/internal/dependencies/api_module.dart';

class EventsRepositoryModule {
  static EventsRepository? _eventsRepository;

  static EventsRepository eventsRepository() {
    _eventsRepository ??= EventsDataRepository(
      ApiModule.apiUtil(),
    );
    return _eventsRepository!;
  }
}
