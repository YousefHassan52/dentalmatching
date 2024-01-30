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
      padding: EdgeInsets.only(top: Get.width * 0.15),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: AppColors.blueTextColor,
            fontSize: Get.width * 0.08,
            fontWeight: FontWeight.w800,
            height: 1.2, 
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }
}
