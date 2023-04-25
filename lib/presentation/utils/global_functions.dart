import 'package:intl/intl.dart';


abstract class GlobalFunctions{
  static String getFormattedDateTimeString(DateTime dateTime){
    return DateFormat("dd.MM.yyyy HH:mm").format(dateTime);
  }

  static String getFormattedDateString(DateTime dateTime){
    return DateFormat("dd.MM.yyyy").format(dateTime);
  }
}