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
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:auto_route/empty_router_widgets.dart' as _i2;
import 'package:flutter/material.dart' as _i6;

import '../navigator.dart' as _i7;
import '../screens/events/events_screen.dart' as _i3;
import '../screens/home/home_screen.dart' as _i1;
import '../screens/profile/profile_screen.dart' as _i4;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i5.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.HomeScreen(),
        transitionsBuilder: _i7.CustomNavigationTransistor.fade,
        durationInMilliseconds: 200,
        opaque: true,
        barrierDismissible: false,
      );
    },
    EventsScreen.name: (routeData) {
      return _i5.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
        transitionsBuilder: _i7.CustomNavigationTransistor.fade,
        durationInMilliseconds: 200,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ProfileScreen.name: (routeData) {
      return _i5.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
        transitionsBuilder: _i7.CustomNavigationTransistor.fade,
        durationInMilliseconds: 200,
        opaque: true,
        barrierDismissible: false,
      );
    },
    EventsRoute.name: (routeData) {
      return _i5.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.EventsScreen(),
        transitionsBuilder: _i7.CustomNavigationTransistor.fade,
        durationInMilliseconds: 200,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ProfileRoute.name: (routeData) {
      return _i5.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.ProfileScreen(),
        transitionsBuilder: _i7.CustomNavigationTransistor.fade,
        durationInMilliseconds: 200,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          HomeRoute.name,
          path: '/',
          children: [
            _i5.RouteConfig(
              EventsScreen.name,
              path: 'events',
              parent: HomeRoute.name,
              children: [
                _i5.RouteConfig(
                  EventsRoute.name,
                  path: '',
                  parent: EventsScreen.name,
                  meta: <String, dynamic>{'noResizeToAvoidBottomInset': true},
                )
              ],
            ),
            _i5.RouteConfig(
              ProfileScreen.name,
              path: 'profile',
              parent: HomeRoute.name,
              children: [
                _i5.RouteConfig(
                  ProfileRoute.name,
                  path: '',
                  parent: ProfileScreen.name,
                  meta: <String, dynamic>{'noResizeToAvoidBottomInset': true},
                )
              ],
            ),
          ],
        )
      ];
}

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class EventsScreen extends _i5.PageRouteInfo<void> {
  const EventsScreen({List<_i5.PageRouteInfo>? children})
      : super(
          EventsScreen.name,
          path: 'events',
          initialChildren: children,
        );

  static const String name = 'EventsScreen';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class ProfileScreen extends _i5.PageRouteInfo<void> {
  const ProfileScreen({List<_i5.PageRouteInfo>? children})
      : super(
          ProfileScreen.name,
          path: 'profile',
          initialChildren: children,
        );

  static const String name = 'ProfileScreen';
}

/// generated route for
/// [_i3.EventsScreen]
class EventsRoute extends _i5.PageRouteInfo<void> {
  const EventsRoute()
      : super(
          EventsRoute.name,
          path: '',
        );

  static const String name = 'EventsRoute';
}

/// generated route for
/// [_i4.ProfileScreen]
class ProfileRoute extends _i5.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: '',
        );

  static const String name = 'ProfileRoute';
}
