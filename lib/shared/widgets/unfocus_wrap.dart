import 'package:flutter/material.dart';

class UnfocusWrap extends StatelessWidget {
  const UnfocusWrap({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Container(color: Colors.transparent, child: child));
  }
}
