import 'package:flutter/material.dart';
import 'package:nova_circle_alt/features/discover/get_inspired/get_inspired_screen.dart';
import 'package:nova_circle_alt/features/explore/feed/feed_screen.dart';
import 'package:nova_circle_alt/features/lists/my_list/my_lists_screen.dart';
import 'package:nova_circle_alt/features/profile/user_profile/user_profile_screen.dart';

import 'widgets/bottom_navbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomePages selectedPage = HomePages.explore;

  final listPage = {
    HomePages.explore: const FeedScreen(),
    HomePages.discover: const GetInspiredScreen(),
    HomePages.lists: const MyListsScreen(),
    HomePages.you: const UserProfileScreen()
  };

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: listPage[selectedPage] as Widget,
        bottomNavigationBar: BottomNavbar(
            selected: selectedPage,
            onChange: (selected) => setState(() => selectedPage = selected)),
      ),
    );
  }
}
