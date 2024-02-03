// ignore_for_file: avoid_print

import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/constants/routes_names.dart';
import 'package:dentalmatching/features/common_faetures/loginn/controller/login_controller_abstract.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginControllerImp extends LoginControllerAbstract {
  // LoginData loginData = LoginData(Get.find());
  RequestStatus? requestStatus;
  Map<String, dynamic> user = {};
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
      Get.defaultDialog(middleText: "Logged in <3");
      // // initialize request status
      // requestStatus = RequestStatus.LOADING;
      // var response = await loginData.postData(
      //     email: emailController.text, password: passwordController.text);
      // print(response.toString());
      // requestStatus = HandlingResponseType.fun(response);
      // print("joe ;${requestStatus.toString()}");
      // update();
      // if (requestStatus == RequestStatus.SUCCESS) {
      //   // handle type kman 34an hayb2a fe doctor and patient
      //   if (response['success'] == true) {
      //     user.addAll(response["data"]);
      //     if (response["data"]["user_approve"] == 1) {
      //       // save  in sharedPref
      //       myServices.sharedPref
      //           .setInt("user_id", response["data"]["user_id"]);
      //       myServices.sharedPref
      //           .setString("user_name", response["data"]["user_name"]);
      //       myServices.sharedPref
      //           .setString("user_email", response["data"]["user_email"]);
      //       myServices.sharedPref
      //           .setString("user_phone", response["data"]["user_phone"]);
      //       myServices.sharedPref.setBool("logged", true);

      //       Get.offAllNamed(AppRoutes.home);
      //     } else {
      //       // 2olna m4 han3mel verify email ... han3mel forget bs
      //       Get.offAllNamed(AppRoutes.verifyEmailCode,
      //           arguments: {"email": emailController.text});
      //     }
      //   } else {
      //     Get.defaultDialog(title: "Try Again", middleText: response['msg']);
      //     requestStatus = RequestStatus.FAILURE;
      //     update();
      //   }
      // }
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
