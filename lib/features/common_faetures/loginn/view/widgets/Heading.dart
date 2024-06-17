import 'package:dentalmatching/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Heading extends StatelessWidget {
  final String text;

  const Heading({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Get.width * 0.02),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: AppColors.blueTextColor,
            fontSize: 20,
            fontWeight: FontWeight.w800,
            height: 1.2,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}
