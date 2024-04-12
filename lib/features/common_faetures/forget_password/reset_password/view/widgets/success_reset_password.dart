import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void successResetPasswordWidget() {
  Get.defaultDialog(
    buttonColor: Colors.white,
    confirmTextColor: AppColors.mainColor,
    title: "Success".tr,
    middleText: "Password Reseted Successfully".tr,
    barrierDismissible: false,
    onConfirm: () {
      Get.offAllNamed(AppRoutes.login);
    },
  );
}
