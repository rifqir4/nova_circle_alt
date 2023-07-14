import 'package:flutter/material.dart';
import 'package:nova_circle_alt/core/utils/app_global.dart';
import 'package:nova_circle_alt/features/lists/my_list/my_lists_screen.dart';
import 'package:nova_circle_alt/features/lists/wish_list/wish_list_screen.dart';

import '../../lists/visited_list/visited_list.dart';

class ListsRoute {
  static const myListsScreen = "/lists/myList";
  static const wishListScreen = "/lists/wishlist";
  static const visitedListScreen = "/lists/visitedlist";
}

class ListsNavigator extends StatelessWidget {
  const ListsNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: listsNavigatorKey,
      initialRoute: ListsRoute.myListsScreen,
      onGenerateRoute: (settings) {
        late Widget screen;

        switch (settings.name) {
          case ListsRoute.myListsScreen:
            screen = const MyListsScreen();
          case ListsRoute.wishListScreen:
            screen = const WishListScreen();
          case ListsRoute.visitedListScreen:
            screen = const VisitedListScreen();
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
