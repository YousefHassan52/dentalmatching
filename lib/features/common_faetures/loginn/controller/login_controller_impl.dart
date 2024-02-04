// ignore_for_file: avoid_print

import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/constants/routes_names.dart';
import 'package:dentalmatching/core/functions/handling_response_type.dart';
import 'package:dentalmatching/features/common_faetures/loginn/controller/login_controller_abstract.dart';
import 'package:dentalmatching/features/common_faetures/loginn/data/login_patient.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginControllerImp extends LoginControllerAbstract {
  LoginData loginData = LoginData(Get.find());
  RequestStatus? requestStatus;
  bool notVisible = true;
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // MyServices myServices =
  //     Get.find(); // ma3molo put fe el main fa 2a2der 2 find_oh hena 3ady

  @override
  void changePasswordVisibility() {
    notVisible = !notVisible;
    update();
  }

  @override
  void goToPreSignupScreen() {
    Get.toNamed(AppRoutes.userType);
  }

  @override
  void goToSignupScreen() {
    Get.toNamed(AppRoutes.signupPatinet);
  }

  @override
  void login() async {
    if (formKey.currentState!.validate()) {
      print(phoneController.text + passwordController.text);
      requestStatus = RequestStatus.LOADING;
      update();
      var response = await loginData.postData(
          phoneNumber: phoneController.text, password: passwordController.text);
      print(response.toString());
      requestStatus = HandlingResponseType.fun(response);
      update();
      print("joe ;${requestStatus.toString()}");
      if (requestStatus == RequestStatus.SUCCESS) {
        // handle type kman 34an hayb2a fe doctor and patient
        if (response['success'] == true) {
          if (response["data"]["role"] == "Doctor") {
            Get.defaultDialog(
                title: "Hello ${response["data"]["role"]}",
                middleText: "${response["data"]["firstName"]}");
            // save  in sharedPref
            //    myServices.sharedPref
            //        .setInt("user_id", response["data"]["user_id"]);
            //    myServices.sharedPref
            //        .setString("user_name", response["data"]["user_name"]);
            //    myServices.sharedPref
            //        .setString("user_email", response["data"]["user_email"]);
            //    myServices.sharedPref
            //        .setString("user_phone", response["data"]["user_phone"]);
            //    myServices.sharedPref.setBool("logged", true);
            //    Get.offAllNamed(AppRoutes.home);
            //  }
            //else {
            // 2olna m4 han3mel verify email ... han3mel forget bs
            //  Get.offAllNamed(AppRoutes.verifyEmailCode,
            //      arguments: {"email": emailController.text});
          }
          if (response["data"]["role"] == "Patient") {
            Get.defaultDialog(
                title: "Hello ${response["data"]["role"]}",
                middleText: "${response["data"]["firstName"]}");
          }
        }
      } else if (requestStatus == RequestStatus.UNAUTHORIZED_FAILURE) {
        Get.defaultDialog(middleText: "Incorrect Phone or Password");
      } else {
        Get.defaultDialog(middleText: "Server Error Please Try Again");
      }
    }
  }

  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void goToForgetPassword() {
    Get.toNamed(AppRoutes.checkEmailForgetPassword);
  }
}
