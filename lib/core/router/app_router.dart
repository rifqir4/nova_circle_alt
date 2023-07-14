import 'package:flutter/material.dart';
import 'package:nova_circle_alt/core/router/app_routes.dart';
import 'package:nova_circle_alt/core/router/app_screens.dart';

class AppRouter {
  static void setTrackRoute(String? name) {
    //Do Something
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final pageName = settings.name;
    setTrackRoute(pageName);

    switch (pageName) {
      case AppRoutes.noInternet:
        return AppScreens.noInternet(settings);
      case AppRoutes.error404:
        return AppScreens.error404(settings);
      case AppRoutes.splash:
        return AppScreens.splash();
      case AppRoutes.intro:
        return AppScreens.intro();
      case AppRoutes.auth:
        return AppScreens.auth();
      case AppRoutes.agreement:
        return AppScreens.agreement();
      case AppRoutes.verifyPhone:
        return AppScreens.verifyPhone();
      case AppRoutes.verifyOtp:
        return AppScreens.verifyOtp();
      case AppRoutes.contactPermission:
        return AppScreens.contactPermission();
      case AppRoutes.contactSync:
        return AppScreens.contactSync();
      case AppRoutes.contentPrefer:
        return AppScreens.contentPreffer();
      case AppRoutes.budgetSelection:
        return AppScreens.budgetSelection();
      case AppRoutes.home:
        return AppScreens.home(settings);
      case AppRoutes.addNewList:
        return AppScreens.addNewList(settings);
      default:
        return AppScreens.undefined(settings);
    }
  }
}
