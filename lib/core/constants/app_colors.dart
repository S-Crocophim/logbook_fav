import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFFFA6A26);
  static const secondary = Color(0xFFF2F2F2);
  static const background = Color(0xFFFFFFFF);
  static const textPrimary = Color(0xFF222222);
  static const textSecondary = Color(0xFF666666);
  static const accent = Color(0xFF0175C2);

  static const MaterialColor primarySwatch = MaterialColor(
    0xFFFA6A26,
    <int, Color>{
      50: Color(0xFFFFF0E5),
      100: Color(0xFFFFDAB8),
      200: Color(0xFFFEC38A),
      300: Color(0xFFFDAC5C),
      400: Color(0xFFFC952E),
      500: primary,
      600: Color(0xFFF95B21),
      700: Color(0xFFF84C1C),
      800: Color(0xFFF73D17),
      900: Color(0xFFF52E12),
    },
  );
}