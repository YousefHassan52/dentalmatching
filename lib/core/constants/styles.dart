import 'package:dentalmatching/core/constants/colors.dart';
import 'package:flutter/material.dart';

abstract class Styles {
  static const TextStyle extraLargetitle = TextStyle(
      color: AppColors.mainColor, fontWeight: FontWeight.w700, fontSize: 42);
  static const TextStyle mediumTitle = TextStyle(
      color: AppColors.mainColor, fontWeight: FontWeight.w700, fontSize: 26);
  static const TextStyle formTitle = TextStyle(
      color: AppColors.mainColor, fontWeight: FontWeight.w700, fontSize: 28);
  static const TextStyle largetitle = TextStyle(
      color: AppColors.mainColor, fontWeight: FontWeight.w700, fontSize: 32);
  static const TextStyle textStyle16 = TextStyle(
      color: AppColors.greyTextColor,
      fontWeight: FontWeight.w600,
      fontSize: 18);
  static const TextStyle textStyleGrey = TextStyle(
      color: AppColors.greyTextColor,
      fontWeight: FontWeight.bold,
      fontSize: 18);
  static const TextStyle textStyle16White =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16);
  static const TextStyle textStyle16Grey = TextStyle(
      color: Color.fromARGB(255, 118, 116, 116),
      fontWeight: FontWeight.normal,
      fontSize: 16);

  static const TextStyle textStyle16LightBlue = TextStyle(
      color: AppColors.blueLightTextColor,
      fontWeight: FontWeight.w400,
      fontSize: 18);
  static const TextStyle LightBlue = TextStyle(
      color: AppColors.blueLightTextColor,
      fontWeight: FontWeight.bold,
      fontSize: 100);

  static const TextStyle textStyle15LightBlue = TextStyle(
      color: AppColors.blueLightTextColor,
      fontWeight: FontWeight.w400,
      fontSize: 17);

  static const TextStyle boxText = TextStyle(
      color: AppColors.mainColor, fontWeight: FontWeight.w700, fontSize: 15);
  static const TextStyle greySpacer = TextStyle(
      color: Color.fromARGB(255, 118, 116, 116),
      fontWeight: FontWeight.normal,
      fontSize: 16,
      letterSpacing: 3);



  static const TextStyle Bio = TextStyle(
      color: Color.fromARGB(255, 118, 116, 116),
      fontWeight: FontWeight.normal,
      fontSize: 25,
      letterSpacing: 3);



      
  static const TextStyle descripativeText = TextStyle(
    color: AppColors.greyTextColor,
    fontSize: 23,
    fontWeight: FontWeight.w500,
    // backgroundColor: AppColors.circleColor,
  );
}
