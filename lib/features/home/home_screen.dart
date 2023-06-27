import 'package:flutter/material.dart';
import 'package:nova_circle_alt/features/home/widgets/bottom_navbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomePages selectedPage = HomePages.feed;

  final listPage = {
    HomePages.feed: const ExamplePage(name: "Feed Page"),
    HomePages.discover: const ExamplePage(name: "Discover Page"),
    HomePages.lists: const ExamplePage(name: "Lists"),
    HomePages.you: const ExamplePage(name: "you")
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: listPage[selectedPage] as Widget,
      bottomNavigationBar: BottomNavbar(
          selected: selectedPage,
          onChange: (selected) => setState(() => selectedPage = selected)),
    );
  }
}

class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(name)),
    );
  }
}
