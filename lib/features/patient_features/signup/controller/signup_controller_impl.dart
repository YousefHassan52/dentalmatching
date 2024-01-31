import 'package:dentalmatching/features/patient_features/signup/controller/signup_controller_asbtract.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupControllerImpl extends SignupControllerAbstract {
  bool notVisible = true;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController ageController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  String? gov;
  String? gender;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void signup() {
    if (formKey.currentState!.validate()) {
      Get.defaultDialog(middleText: "$gov and $gender");
    }
  }

  @override
  void onInit() {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    ageController = TextEditingController();

    phoneController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  void changePasswordVisibility() {
    notVisible = !notVisible;
    update();
  }
}
