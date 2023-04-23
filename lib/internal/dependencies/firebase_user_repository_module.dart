import 'package:events_attendance/data/repository/firebase_user_data_repository.dart';
import 'package:events_attendance/domain/repository/firebase_user_repository.dart';
import 'package:events_attendance/internal/dependencies/api_module.dart';

class FirebaseUserRepositoryModule {
  static FirebaseUserRepository? _firebaseUserRepository;

  static FirebaseUserRepository getUserRepository() {
    _firebaseUserRepository ??= FirebaseUserDataRepository(
      ApiModule.apiUtil(),
    );
    return _firebaseUserRepository!;
  }
}
