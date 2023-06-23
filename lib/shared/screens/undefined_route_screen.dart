import 'package:flutter/material.dart';

class UndefinedRouteScreen extends StatelessWidget {
  const UndefinedRouteScreen({
    super.key,
    required this.routeName,
  });

  final String routeName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('No $routeName route found!'),
      ),
    );
  }
}
