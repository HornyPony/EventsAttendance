// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Events`
  String get events {
    return Intl.message(
      'Events',
      name: 'events',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Events\nAttendance`
  String get app_title {
    return Intl.message(
      'Events\nAttendance',
      name: 'app_title',
      desc: '',
      args: [],
    );
  }

  /// `BlackBoard Login`
  String get auth_email {
    return Intl.message(
      'BlackBoard Login',
      name: 'auth_email',
      desc: '',
      args: [],
    );
  }

  /// `BlackBoard Password`
  String get auth_password {
    return Intl.message(
      'BlackBoard Password',
      name: 'auth_password',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get sign_in {
    return Intl.message(
      'Sign In',
      name: 'sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Search by name, place or date`
  String get search_events_hint_text {
    return Intl.message(
      'Search by name, place or date',
      name: 'search_events_hint_text',
      desc: '',
      args: [],
    );
  }

  /// `Username or password entered incorrectly`
  String get auth_error {
    return Intl.message(
      'Username or password entered incorrectly',
      name: 'auth_error',
      desc: '',
      args: [],
    );
  }

  /// `You are here:`
  String get user_location {
    return Intl.message(
      'You are here:',
      name: 'user_location',
      desc: '',
      args: [],
    );
  }

  /// `Distance to the event:`
  String get event_distance {
    return Intl.message(
      'Distance to the event:',
      name: 'event_distance',
      desc: '',
      args: [],
    );
  }

  /// `m`
  String get meter_short {
    return Intl.message(
      'm',
      name: 'meter_short',
      desc: '',
      args: [],
    );
  }

  /// `Marking of arrival`
  String get mark_visit {
    return Intl.message(
      'Marking of arrival',
      name: 'mark_visit',
      desc: '',
      args: [],
    );
  }

  /// `Marking of leaving`
  String get mark_leave {
    return Intl.message(
      'Marking of leaving',
      name: 'mark_leave',
      desc: '',
      args: [],
    );
  }

  /// `You are far away from the event`
  String get long_distance {
    return Intl.message(
      'You are far away from the event',
      name: 'long_distance',
      desc: '',
      args: [],
    );
  }

  /// `Wait`
  String get wait {
    return Intl.message(
      'Wait',
      name: 'wait',
      desc: '',
      args: [],
    );
  }

  /// `I'm here`
  String get user_visit {
    return Intl.message(
      'I\'m here',
      name: 'user_visit',
      desc: '',
      args: [],
    );
  }

  /// `I'm leaving`
  String get user_leave {
    return Intl.message(
      'I\'m leaving',
      name: 'user_leave',
      desc: '',
      args: [],
    );
  }

  /// `You leave earlier by:`
  String get user_leave_early {
    return Intl.message(
      'You leave earlier by:',
      name: 'user_leave_early',
      desc: '',
      args: [],
    );
  }

  /// `You were delayed by:`
  String get user_leave_late {
    return Intl.message(
      'You were delayed by:',
      name: 'user_leave_late',
      desc: '',
      args: [],
    );
  }

  /// `Before the event:`
  String get user_visit_early {
    return Intl.message(
      'Before the event:',
      name: 'user_visit_early',
      desc: '',
      args: [],
    );
  }

  /// `You're late for:`
  String get user_visit_late {
    return Intl.message(
      'You\'re late for:',
      name: 'user_visit_late',
      desc: '',
      args: [],
    );
  }

  /// `d.`
  String get days_short {
    return Intl.message(
      'd.',
      name: 'days_short',
      desc: '',
      args: [],
    );
  }

  /// `h.`
  String get hours_short {
    return Intl.message(
      'h.',
      name: 'hours_short',
      desc: '',
      args: [],
    );
  }

  /// `min.`
  String get minutes_short {
    return Intl.message(
      'min.',
      name: 'minutes_short',
      desc: '',
      args: [],
    );
  }

  /// `Check in`
  String get mark_attendance {
    return Intl.message(
      'Check in',
      name: 'mark_attendance',
      desc: '',
      args: [],
    );
  }

  /// `Thank you for visiting!`
  String get event_attended {
    return Intl.message(
      'Thank you for visiting!',
      name: 'event_attended',
      desc: '',
      args: [],
    );
  }

  /// `Thanks! You didn't check in at the beginning`
  String get event_attended_but_not_at_start {
    return Intl.message(
      'Thanks! You didn\'t check in at the beginning',
      name: 'event_attended_but_not_at_start',
      desc: '',
      args: [],
    );
  }

  /// `Check in from your device`
  String get check_in_from_ur_device {
    return Intl.message(
      'Check in from your device',
      name: 'check_in_from_ur_device',
      desc: '',
      args: [],
    );
  }

  /// `change`
  String get change {
    return Intl.message(
      'change',
      name: 'change',
      desc: '',
      args: [],
    );
  }

  /// `You can change the device after:`
  String get rebind_after {
    return Intl.message(
      'You can change the device after:',
      name: 'rebind_after',
      desc: '',
      args: [],
    );
  }

  /// `Your device`
  String get user_device {
    return Intl.message(
      'Your device',
      name: 'user_device',
      desc: '',
      args: [],
    );
  }

  /// `gr.`
  String get group_short {
    return Intl.message(
      'gr.',
      name: 'group_short',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
