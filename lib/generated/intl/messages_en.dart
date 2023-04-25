// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "app_title": MessageLookupByLibrary.simpleMessage("Events\nAttendance"),
        "auth_email": MessageLookupByLibrary.simpleMessage("BlackBoard Login"),
        "auth_error": MessageLookupByLibrary.simpleMessage(
            "Username or password entered incorrectly"),
        "auth_password":
            MessageLookupByLibrary.simpleMessage("BlackBoard Password"),
        "change": MessageLookupByLibrary.simpleMessage("change"),
        "check_in_from_ur_device":
            MessageLookupByLibrary.simpleMessage("Check in from your device"),
        "days_short": MessageLookupByLibrary.simpleMessage("d."),
        "event_attended":
            MessageLookupByLibrary.simpleMessage("Thank you for visiting!"),
        "event_attended_but_not_at_start": MessageLookupByLibrary.simpleMessage(
            "Thanks! You didn\'t check in at the beginning"),
        "event_distance":
            MessageLookupByLibrary.simpleMessage("Distance to the event:"),
        "events": MessageLookupByLibrary.simpleMessage("Events"),
        "group_short": MessageLookupByLibrary.simpleMessage("gr."),
        "hours_short": MessageLookupByLibrary.simpleMessage("h."),
        "long_distance": MessageLookupByLibrary.simpleMessage(
            "You are far away from the event"),
        "mark_attendance": MessageLookupByLibrary.simpleMessage("Check in"),
        "mark_leave":
            MessageLookupByLibrary.simpleMessage("Marking of leaving"),
        "mark_visit":
            MessageLookupByLibrary.simpleMessage("Marking of arrival"),
        "meter_short": MessageLookupByLibrary.simpleMessage("m"),
        "minutes_short": MessageLookupByLibrary.simpleMessage("min."),
        "profile": MessageLookupByLibrary.simpleMessage("Profile"),
        "rebind_after": MessageLookupByLibrary.simpleMessage(
            "You can change the device after:"),
        "search_events_hint_text": MessageLookupByLibrary.simpleMessage(
            "Search by name, place or date"),
        "sign_in": MessageLookupByLibrary.simpleMessage("Sign In"),
        "user_device": MessageLookupByLibrary.simpleMessage("Your device"),
        "user_leave": MessageLookupByLibrary.simpleMessage("I\'m leaving"),
        "user_leave_early":
            MessageLookupByLibrary.simpleMessage("You leave earlier by:"),
        "user_leave_late":
            MessageLookupByLibrary.simpleMessage("You were delayed by:"),
        "user_location": MessageLookupByLibrary.simpleMessage("You are here:"),
        "user_visit": MessageLookupByLibrary.simpleMessage("I\'m here"),
        "user_visit_early":
            MessageLookupByLibrary.simpleMessage("Before the event:"),
        "user_visit_late":
            MessageLookupByLibrary.simpleMessage("You\'re late for:"),
        "wait": MessageLookupByLibrary.simpleMessage("Wait")
      };
}
