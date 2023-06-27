import 'package:flutter/material.dart';

class AppInputDecor {
  AppInputDecor._();

  static InputDecoration minimal = const InputDecoration(
    isDense: true,
    contentPadding: EdgeInsets.zero,
    border: OutlineInputBorder(borderSide: BorderSide.none),
    enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
    focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
    errorBorder: OutlineInputBorder(borderSide: BorderSide.none),
  );
}
