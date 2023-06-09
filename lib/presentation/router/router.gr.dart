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
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:auto_route/empty_router_widgets.dart' as _i3;
import 'package:flutter/cupertino.dart' as _i11;
import 'package:flutter/material.dart' as _i8;

import '../../domain/model/event_item.dart' as _i12;
import '../navigator.dart' as _i10;
import '../screens/event_single/event_single_screen.dart' as _i6;
import '../screens/events/events_screen.dart' as _i5;
import '../screens/home/home_screen.dart' as _i2;
import '../screens/login/login_screen.dart' as _i1;
import '../screens/profile/profile_screen.dart' as _i4;
import 'auth_guard.dart' as _i9;

class AppRouter extends _i7.RootStackRouter {
  AppRouter({
    _i8.GlobalKey<_i8.NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final _i9.AuthGuard authGuard;

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.LoginScreen(),
        transitionsBuilder: _i10.CustomNavigationTransistor.fade,
        durationInMilliseconds: 200,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
        transitionsBuilder: _i10.CustomNavigationTransistor.fade,
        durationInMilliseconds: 200,
        opaque: true,
        barrierDismissible: false,
      );
    },
    EventsRouter.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.EmptyRouterPage(),
        transitionsBuilder: _i10.CustomNavigationTransistor.fade,
        durationInMilliseconds: 200,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ProfileRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.ProfileScreen(),
        transitionsBuilder: _i10.CustomNavigationTransistor.fade,
        durationInMilliseconds: 200,
        opaque: true,
        barrierDismissible: false,
      );
    },
    EventsRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i5.EventsScreen(),
        transitionsBuilder: _i10.CustomNavigationTransistor.fade,
        durationInMilliseconds: 200,
        opaque: true,
        barrierDismissible: false,
      );
    },
    EventSingleRoute.name: (routeData) {
      final args = routeData.argsAs<EventSingleRouteArgs>();
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: _i6.EventSingleScreen(
          key: args.key,
          eventItem: args.eventItem,
        ),
        transitionsBuilder: _i10.CustomNavigationTransistor.fade,
        durationInMilliseconds: 200,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          LoginRoute.name,
          path: '/',
          meta: <String, dynamic>{'noResizeToAvoidBottomInset': true},
          guards: [authGuard],
        ),
        _i7.RouteConfig(
          HomeRoute.name,
          path: 'home_screen',
          children: [
            _i7.RouteConfig(
              EventsRouter.name,
              path: 'events',
              parent: HomeRoute.name,
              children: [
                _i7.RouteConfig(
                  EventsRoute.name,
                  path: '',
                  parent: EventsRouter.name,
                  meta: <String, dynamic>{'noResizeToAvoidBottomInset': true},
                ),
                _i7.RouteConfig(
                  EventSingleRoute.name,
                  path: 'event_single',
                  parent: EventsRouter.name,
                ),
              ],
            ),
            _i7.RouteConfig(
              ProfileRoute.name,
              path: 'profile',
              parent: HomeRoute.name,
              meta: <String, dynamic>{'noResizeToAvoidBottomInset': true},
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.LoginScreen]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          path: 'home_screen',
          initialChildren: children,
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class EventsRouter extends _i7.PageRouteInfo<void> {
  const EventsRouter({List<_i7.PageRouteInfo>? children})
      : super(
          EventsRouter.name,
          path: 'events',
          initialChildren: children,
        );

  static const String name = 'EventsRouter';
}

/// generated route for
/// [_i4.ProfileScreen]
class ProfileRoute extends _i7.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: 'profile',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i5.EventsScreen]
class EventsRoute extends _i7.PageRouteInfo<void> {
  const EventsRoute()
      : super(
          EventsRoute.name,
          path: '',
        );

  static const String name = 'EventsRoute';
}

/// generated route for
/// [_i6.EventSingleScreen]
class EventSingleRoute extends _i7.PageRouteInfo<EventSingleRouteArgs> {
  EventSingleRoute({
    _i11.Key? key,
    required _i12.EventItem eventItem,
  }) : super(
          EventSingleRoute.name,
          path: 'event_single',
          args: EventSingleRouteArgs(
            key: key,
            eventItem: eventItem,
          ),
        );

  static const String name = 'EventSingleRoute';
}

class EventSingleRouteArgs {
  const EventSingleRouteArgs({
    this.key,
    required this.eventItem,
  });

  final _i11.Key? key;

  final _i12.EventItem eventItem;

  @override
  String toString() {
    return 'EventSingleRouteArgs{key: $key, eventItem: $eventItem}';
  }
}
