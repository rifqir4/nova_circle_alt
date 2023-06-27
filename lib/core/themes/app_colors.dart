import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  //COMMON COLOR
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  //APP COLOR
  static const Color blueSky = Color(0xFF00496D);
  static const Color greyDarkest = Color(0xFF404B59);
  static const Color greyDarker = Color(0xFF6E7A89);
  static const Color grey = Color(0xFFAEBECC);
  static const Color greyLightest = Color(0xFFF8F9FA);
  static const Color greyLighter = Color(0xFFD5DDE4);
  static const Color sunset = Color(0xFFFA7328);

  static const Color background = greyLightest;
  static const Color textTitle = greyDarkest;
  static const Color text = greyDarker;
  static Color modalOverlay = blueSky.withOpacity(0.75);
}
