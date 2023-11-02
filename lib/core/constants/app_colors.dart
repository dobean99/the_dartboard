import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF232323);
  static const Color howlingPink = Color(0xFFE20E50);

  static const Color doveGrey = Color(0xFF6d6d6d);
  static const Color blackColor = Colors.black;
  static const Color whiteColor = Colors.white;
  static const Color bgButtonColor = Color(0xFF532020);

  static const Color lightTextColor = Color.fromRGBO(122, 134, 154, 1);

  static Shader linearGradient = const LinearGradient(
    colors: <Color>[blackColor, primaryColor, doveGrey],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 0.0, 0.0));

  static const LinearGradient blackToGrey = LinearGradient(
    colors: <Color>[blackColor, primaryColor, doveGrey],
  );
}
