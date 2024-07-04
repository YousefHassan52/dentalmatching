import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PreSignUpWidget extends StatelessWidget {
  const PreSignUpWidget({
    super.key,
    required this.role,
    required this.image,
    required this.onTap,
  });
  final String role;
  final String image;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    MyServices languageController = Get.find();

    return IconButton(
      onPressed: onTap,
      icon: FittedBox(
        fit:  BoxFit.scaleDown,
        child: Column(
          children: [
            Center(
              child: Container(
                height: Get.height * 0.988888,
                margin: const EdgeInsets.symmetric(vertical: 4),
                decoration: const BoxDecoration(),
                child: Image.asset(image),
              ),
            ),
            if (languageController.sharedPref.getString("lang") == "en")
              Center(
                child: Text(
                  role,
                  style: const TextStyle(
                    fontSize: 80,
                    color: AppColors.blueTextColor,
                    letterSpacing: 10,
                  ),
                ),
              ),
            if (languageController.sharedPref.getString("lang") == "ar")
              Text(
                role,
                style: const TextStyle(
                    fontSize: 80, color: AppColors.blueTextColor),
              )
          ],
        ),
      ),
    );
  }
}
