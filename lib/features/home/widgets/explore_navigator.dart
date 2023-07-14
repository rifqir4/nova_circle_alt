import 'package:flutter/material.dart';
import 'package:nova_circle_alt/core/utils/app_global.dart';
import 'package:nova_circle_alt/features/explore/circle_list/circle_list_screen.dart';
import 'package:nova_circle_alt/features/explore/city/city_screen.dart';
import 'package:nova_circle_alt/features/explore/feed/feed_screen.dart';

class ExploreRoute {
  static const feedScreen = "/explore/feed";
  static const circleListScreen = "/explore/circlelist";
  static const cityScreen = "/explore/city";
}

class ExploreNavigator extends StatelessWidget {
  const ExploreNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: exploreNavigatorKey,
      initialRoute: ExploreRoute.feedScreen,
      onGenerateRoute: (settings) {
        late Widget screen;

        switch (settings.name) {
          case ExploreRoute.feedScreen:
            screen = const FeedScreen();
          case ExploreRoute.circleListScreen:
            screen = const CircleListScreen();
          case ExploreRoute.cityScreen:
            screen = const CityScreen();
          default:
            screen = const Scaffold();
        }

        return MaterialPageRoute<dynamic>(
          builder: (context) => screen,
          settings: settings,
        );
      },
    );
  }
}
