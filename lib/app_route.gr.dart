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
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/cupertino.dart' as _i4;
import 'package:flutter/material.dart' as _i3;

import 'Screens/MainScreen/main_screen.dart' as _i1;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i3.GlobalKey<_i3.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    MainScreen.name: (routeData) {
      final args = routeData.argsAs<MainScreenArgs>(
          orElse: () => const MainScreenArgs());
      return _i2.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.MainScreen(
          key: args.key,
          tabNum: args.tabNum,
        ),
      );
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(
          MainScreen.name,
          path: '/',
        )
      ];
}

/// generated route for
/// [_i1.MainScreen]
class MainScreen extends _i2.PageRouteInfo<MainScreenArgs> {
  MainScreen({
    _i4.Key? key,
    int tabNum = 0,
  }) : super(
          MainScreen.name,
          path: '/',
          args: MainScreenArgs(
            key: key,
            tabNum: tabNum,
          ),
        );

  static const String name = 'MainScreen';
}

class MainScreenArgs {
  const MainScreenArgs({
    this.key,
    this.tabNum = 0,
  });

  final _i4.Key? key;

  final int tabNum;

  @override
  String toString() {
    return 'MainScreenArgs{key: $key, tabNum: $tabNum}';
  }
}
