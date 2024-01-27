import 'package:dentalmatching/core/constants/colors.dart';
import 'package:flutter/material.dart';

abstract class Styles {
  static const TextStyle extraLargetitle = TextStyle(
      color: AppColors.mainColor, fontWeight: FontWeight.w700, fontSize: 42);
  static const TextStyle largetitle = TextStyle(
      color: AppColors.mainColor, fontWeight: FontWeight.w700, fontSize: 26);

  static const TextStyle textStyle16 = TextStyle(
      color: AppColors.greyTextColor,
      fontWeight: FontWeight.w600,
      fontSize: 18);
  static const TextStyle textStyle16White =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16);

  static const TextStyle textStyle16LightBlue = TextStyle(
      color: AppColors.blueLightTextColor,
      fontWeight: FontWeight.w400,
      fontSize: 18);
}
