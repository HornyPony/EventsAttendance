// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "app_title":
            MessageLookupByLibrary.simpleMessage("Посещение\nмероприятий"),
        "auth_email": MessageLookupByLibrary.simpleMessage("BlackBoard логин"),
        "auth_error": MessageLookupByLibrary.simpleMessage(
            "Логин или пароль введены неверно"),
        "auth_password":
            MessageLookupByLibrary.simpleMessage("BlackBoard пароль"),
        "change": MessageLookupByLibrary.simpleMessage("изменить"),
        "check_in_from_ur_device": MessageLookupByLibrary.simpleMessage(
            "Отмечайтесь со своего устройства"),
        "days_short": MessageLookupByLibrary.simpleMessage("дн."),
        "event_attended":
            MessageLookupByLibrary.simpleMessage("Спасибо, что посетили!"),
        "event_attended_but_not_at_start": MessageLookupByLibrary.simpleMessage(
            "Спасибо! Вы не отметились в начале"),
        "event_distance":
            MessageLookupByLibrary.simpleMessage("Расстояние до мероприятия:"),
        "events": MessageLookupByLibrary.simpleMessage("Мероприятия"),
        "group_short": MessageLookupByLibrary.simpleMessage("гр."),
        "hours_short": MessageLookupByLibrary.simpleMessage("ч."),
        "long_distance": MessageLookupByLibrary.simpleMessage(
            "Вы находитесь далеко от мероприятия"),
        "mark_attendance": MessageLookupByLibrary.simpleMessage("Отметиться"),
        "mark_leave": MessageLookupByLibrary.simpleMessage("Отметка об уходе"),
        "mark_visit":
            MessageLookupByLibrary.simpleMessage("Отметка о прибытии"),
        "meter_short": MessageLookupByLibrary.simpleMessage("м"),
        "minutes_short": MessageLookupByLibrary.simpleMessage("мин."),
        "profile": MessageLookupByLibrary.simpleMessage("Профиль"),
        "rebind_after": MessageLookupByLibrary.simpleMessage(
            "Сможете изменить устройство через:"),
        "search_events_hint_text": MessageLookupByLibrary.simpleMessage(
            "Поиск по названию, месту или дате мероприятия"),
        "sign_in": MessageLookupByLibrary.simpleMessage("Войти"),
        "user_device": MessageLookupByLibrary.simpleMessage("Ваше устройство"),
        "user_leave": MessageLookupByLibrary.simpleMessage("Я ухожу"),
        "user_leave_early":
            MessageLookupByLibrary.simpleMessage("Вы уходите раньше на:"),
        "user_leave_late":
            MessageLookupByLibrary.simpleMessage("Вы задержались на:"),
        "user_location":
            MessageLookupByLibrary.simpleMessage("Вы находитесь здесь:"),
        "user_visit": MessageLookupByLibrary.simpleMessage("Я пришел"),
        "user_visit_early":
            MessageLookupByLibrary.simpleMessage("До начала мероприятия:"),
        "user_visit_late":
            MessageLookupByLibrary.simpleMessage("Вы опоздали на:"),
        "wait": MessageLookupByLibrary.simpleMessage("Подождите еще")
      };
}
