
import 'package:flutter_dotenv/flutter_dotenv.dart';

class UserDataBody {
  final String login;
  final String password;

  UserDataBody({
    required this.login,
    required this.password,
  });

  Map<String, dynamic> toApi() {
    return {
      "PipelineId": dotenv.get('userLoginPipelineId'),
      "StepId": 10,
      "OutputName": "Row",
      "Variables": {
        "Login": login,
        "Password": password,
      }
    };
  }
}
