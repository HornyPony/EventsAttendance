
class ApiDevice {
  late final String deviceToken;
  late final String deviceName;
  late final DateTime deviceBindingDate;

  ApiDevice.fromApi(Map<String, dynamic> map) {
    deviceToken = map['deviceToken'];
    deviceName = map['deviceName'];
    deviceBindingDate = map['deviceBindingDate'].toDate();
  }
}
