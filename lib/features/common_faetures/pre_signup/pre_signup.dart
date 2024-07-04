import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/routes_names.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Views/widget/pre_sign_up_widget.dart';

class PreSignup extends StatelessWidget {
  const PreSignup({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices languageController = Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,

        leading: IconButton(
          icon: languageController.sharedPref.getString("lang") == "en"
              ? const Icon(
                  Icons.keyboard_double_arrow_right_outlined,
                  color: AppColors.blueTextColor,
                  size: 50,
                )
              : const Icon(
            Icons.keyboard_double_arrow_left_outlined,
            color: AppColors.blueTextColor,
            size: 50,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              PreSignUpWidget(
                role: "DENTIST".tr,
                image: "assets/svg/doctors 1.png",
                onTap: () {
                  Get.toNamed(AppRoutes.signupDoctor);
                },
              ),
              PreSignUpWidget(
                            role: "PATIENT".tr,
                            image: "assets/svg/Dental Patient.png",
                            onTap: () {
              Get.toNamed(AppRoutes.signupPatinet);
                            },
                          ),
            ],
          ),
        ),
        
      ),
    );
  }
}
