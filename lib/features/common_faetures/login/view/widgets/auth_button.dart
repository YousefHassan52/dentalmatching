import 'package:dentalmatching/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.buttonText,
    required this.onTap,
  });
  final String buttonText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: AppColors.mainColor,
      minWidth: Get.width,
      height: 50,
      child: Text(
        buttonText,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
