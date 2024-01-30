import 'package:dentalmatching/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      height: Get.width * 0.1,
      width: Get.width * 0.4,
      child: MaterialButton(
        color: AppColors.blueTextColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Get.width * 0.05)),
        onPressed: onPressed,
        textColor: Colors.white,
        child: Text(
          text,
          style: TextStyle(fontSize: Get.width * 0.04),
        ),
      ),
    );
  }
}
