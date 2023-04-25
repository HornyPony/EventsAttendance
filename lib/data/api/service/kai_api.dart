import 'package:dio/dio.dart';
import 'package:events_attendance/data/api/model/api_user.dart';
import 'package:events_attendance/data/api/request/mobapp_login_body.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_pretty_dio_logger/flutter_pretty_dio_logger.dart';

class KaiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: dotenv.get('kaiServiceBaseUrl'),
    ),
  )..interceptors.add(PrettyDioLogger(
      showCUrl: true,
      canShowLog: true,
    ));

  Future<ApiUser> getUserInfo(
      {required UserDataBody userDataBody, required String login}) async {
    final response = await _dio.post(
      '/Pipeline/GetStepResult?authToken=1d0daa5f-fc66-4d01-97e3-da1fb2337f5f',
      options: _getNoErrorResponsesOptions(),
      data: userDataBody.toApi(),
    );

    return ApiUser.fromApi(response.data, login);
  }

  Options _getNoErrorResponsesOptions() {
    return Options(
      headers: {
        "Content-Type": 'application/json',
      },
    );
  }
}
