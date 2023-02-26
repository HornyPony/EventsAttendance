// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../navigator.dart' as _i8;
import '../screens/event_single/event_single_screen.dart' as _i5;
import '../screens/events/events_screen.dart' as _i3;
import '../screens/home/home_screen.dart' as _i2;
import '../screens/login/login_screen.dart' as _i1;
import '../screens/profile/profile_screen.dart' as _i4;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.LoginScreen(),
        transitionsBuilder: _i8.CustomNavigationTransistor.fade,
        durationInMilliseconds: 200,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeRoute.name: (routeData) {
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
        transitionsBuilder: _i8.CustomNavigationTransistor.fade,
        durationInMilliseconds: 200,
        opaque: true,
        barrierDismissible: false,
      );
    },
    EventsRoute.name: (routeData) {
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.EventsScreen(),
        transitionsBuilder: _i8.CustomNavigationTransistor.fade,
        durationInMilliseconds: 200,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ProfileRoute.name: (routeData) {
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.ProfileScreen(),
        transitionsBuilder: _i8.CustomNavigationTransistor.fade,
        durationInMilliseconds: 200,
        opaque: true,
        barrierDismissible: false,
      );
    },
    EventSingleRoute.name: (routeData) {
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i5.EventSingleScreen(),
        transitionsBuilder: _i8.CustomNavigationTransistor.fade,
        durationInMilliseconds: 200,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          LoginRoute.name,
          path: '/',
          children: [
            _i6.RouteConfig(
              HomeRoute.name,
              path: 'homeScreen',
              parent: LoginRoute.name,
              children: [
                _i6.RouteConfig(
                  EventsRoute.name,
                  path: 'events',
                  parent: HomeRoute.name,
                  meta: <String, dynamic>{'noResizeToAvoidBottomInset': true},
                  children: [
                    _i6.RouteConfig(
                      EventSingleRoute.name,
                      path: 'eventSingle',
                      parent: EventsRoute.name,
                    )
                  ],
                ),
                _i6.RouteConfig(
                  ProfileRoute.name,
                  path: 'profile',
                  parent: HomeRoute.name,
                  meta: <String, dynamic>{'noResizeToAvoidBottomInset': true},
                ),
              ],
            )
          ],
        )
      ];
}

/// generated route for
/// [_i1.LoginScreen]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute({List<_i6.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          path: 'homeScreen',
          initialChildren: children,
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.EventsScreen]
class EventsRoute extends _i6.PageRouteInfo<void> {
  const EventsRoute({List<_i6.PageRouteInfo>? children})
      : super(
          EventsRoute.name,
          path: 'events',
          initialChildren: children,
        );

  static const String name = 'EventsRoute';
}

/// generated route for
/// [_i4.ProfileScreen]
class ProfileRoute extends _i6.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: 'profile',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i5.EventSingleScreen]
class EventSingleRoute extends _i6.PageRouteInfo<void> {
  const EventSingleRoute()
      : super(
          EventSingleRoute.name,
          path: 'eventSingle',
        );

  static const String name = 'EventSingleRoute';
}
