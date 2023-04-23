import 'package:events_attendance/data/repository/get_user_data_repository.dart';
import 'package:events_attendance/domain/repository/get_user_repository.dart';
import 'package:events_attendance/internal/dependencies/api_module.dart';

class GetUserRepositoryModule {
  static GetUserRepository? _getUserRepository;

  static GetUserRepository getUserRepository() {
    _getUserRepository ??= GetUserDataRepository(
      ApiModule.apiUtil(),
    );
    return _getUserRepository!;
  }
}
