import 'package:events_attendance/presentation/utils/constants.dart';

class ApiUser {
  late final String userLogin;
  late final bool isAuthSuccess;
  late final String fio;
  late final String status;
  late final int groupNumber;
  late final String profileName;
  late final String specCode;
  late final String specName;
  late final String instName;
  late final String kafName;
  late final String zachetkaNumber;

  ApiUser.fromApi(Map<String, dynamic> map, String login,) {
    if(map['Data'].isNotEmpty){
      isAuthSuccess = map['success'] ?? false;
      fio = map['Data'][0]['StudFio'] ?? Constants.nullStringValue;
      status = map['Data'][0]['Status'] ?? Constants.nullStringValue;
      profileName = map['Data'][0]['ProfileName'] ?? Constants.nullStringValue;
      specCode = map['Data'][0]['SpecCode'] ?? Constants.nullStringValue;
      specName = map['Data'][0]['SpecName'] ?? Constants.nullStringValue;
      instName = map['Data'][0]['InstName'] ?? Constants.nullStringValue;
      kafName = map['Data'][0]['KafName'] ?? Constants.nullStringValue;
      zachetkaNumber = map['Data'][0]['Zach'] ?? Constants.nullStringValue;
      groupNumber = map['Data'][0]['GroupNum'] ?? Constants.nullIntValue;
    } else {
      isAuthSuccess =  false;
      fio = Constants.nullStringValue;
      status =  Constants.nullStringValue;
      profileName = Constants.nullStringValue;
      specCode = Constants.nullStringValue;
      specName =  Constants.nullStringValue;
      instName = Constants.nullStringValue;
      kafName =  Constants.nullStringValue;
      zachetkaNumber = Constants.nullStringValue;
      groupNumber =  Constants.nullIntValue;
    }
    userLogin = login;


  }
}
