import 'package:dentalmatching/core/constants/colors.dart';
import 'package:flutter/material.dart';

ThemeData englishTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.mainColor),
    useMaterial3: true,
    primaryColor: AppColors.mainColor);

ThemeData arabicTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Cairo",
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.mainColor),
    useMaterial3: true,
    primaryColor: AppColors.mainColor);

ThemeData mainAppTheme = ThemeData(
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.secondColor,
    ),
    primaryColor: AppColors.mainColor,
    useMaterial3: true,
    fontFamily: "Cairo",
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.mainColor));
