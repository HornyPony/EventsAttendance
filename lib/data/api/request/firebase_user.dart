
class FirebaseUserBody {
  final String login;
  final String deviceToken;
  final String deviceName;
  final DateTime deviceBindingDate;
  final DateTime? authTime;

  FirebaseUserBody({
    required this.login,
    required this.deviceToken,
    required this.deviceName,
    required this.deviceBindingDate,
    required this.authTime,
  });

  Map<String, dynamic> toApi() {
    if(authTime != null) {
      return {
        "login": login,
        "deviceToken": deviceToken,
        "deviceName": deviceName,
        "deviceBindingDate": deviceBindingDate,
        "authTime": authTime,
      };
    } else {
      return {
        "deviceToken": deviceToken,
        "deviceName": deviceName,
        "deviceBindingDate": deviceBindingDate,
      };
    }


  }
}
