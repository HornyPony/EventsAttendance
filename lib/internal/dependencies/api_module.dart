import 'package:events_attendance/data/api/api_util.dart';
import 'package:events_attendance/data/api/service/firebase_api.dart';
import 'package:events_attendance/data/api/service/kai_api.dart';

class ApiModule {
  static ApiUtil? _apiUtil;

  static ApiUtil apiUtil() {
    _apiUtil ??= ApiUtil(
      kaiService: KaiService(),
      firebaseService: FirebaseService(),
    );
    return _apiUtil!;
  }
}
