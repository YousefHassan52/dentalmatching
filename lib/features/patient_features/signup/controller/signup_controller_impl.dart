import 'package:dentalmatching/features/patient_features/signup/controller/signup_controller_asbtract.dart';
import 'package:flutter/material.dart';

class SignupControllerImpl extends SignupControllerAbstract {
  bool visible = false;
  late TextEditingController userNameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void signup() {
    // TODO: implement signup
  }

  @override
  void onInit() {
    userNameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }
}
