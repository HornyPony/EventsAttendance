


class FirebaseUserBody {
  final String login;
  final String deviceToken;
  final DateTime? authTime;

  FirebaseUserBody({
    required this.login,
    required this.deviceToken,
    required this.authTime,
  });

  Map<String, dynamic> toApi() {
    return {
      "login": login,
      "deviceToken": deviceToken,
      "authTime": authTime,
    };
  }
}
