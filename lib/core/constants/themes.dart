import 'package:dentalmatching/core/constants/colors.dart';
import 'package:flutter/material.dart';

ThemeData englishTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.mainColor),
    useMaterial3: true,
    primaryColor: AppColors.mainColor);

ThemeData arabicTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Shekari",
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.mainColor),
    useMaterial3: true,
    primaryColor: AppColors.mainColor);
