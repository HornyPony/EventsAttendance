import 'package:intl/intl.dart';


abstract class GlobalFunctions{
  static String getFormattedDateString(DateTime dateTime){
    return DateFormat("dd.MM.yyyy HH:mm").format(dateTime);
  }
}