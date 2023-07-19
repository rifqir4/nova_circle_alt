import 'package:flutter/material.dart';

import '../utils/app_global.dart';

class AppNav {
  AppNav._();

  static final NavigatorState? navState = mainNavigatorKey.currentState;

  static Future<void> go(
    String routeName, {
    Object? arguments,
  }) {
    if (navState == null) throw "Navigator State not found";
    return navState!.pushNamedAndRemoveUntil(
      routeName,
      (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }

  static Future<T?> push<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    if (navState == null) throw "Navigator State not found";
    return navState!.pushNamed<T>(routeName, arguments: arguments);
  }

  static Future<T?> pushWidget<T extends Object?>({
    required Widget widget,
    Object? param,
    void Function(Object?)? callback,
  }) {
    if (navState == null) throw "Navigator State not found";
    return navState!.push(
      MaterialPageRoute(
        builder: (context) => widget,
        settings: RouteSettings(arguments: param),
      ),
    );
  }

  static void back([Object? param]) {
    if (navState == null) throw "Navigator State not found";
    navState!.pop(param);
  }
}
