import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/features/common_faetures/forget_password/reset_password/controller/reset_password_controller_abstract.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ResetPasswordControllerImp extends ResetPasswordControllerAbstract {
  bool passwordOneVisibility = true;

  late TextEditingController firstPassword;
  late String email;

  late GlobalKey<FormState> formKey;

  RequestStatus? requestStatus;
  // RestPasswordData restPasswordData = RestPasswordData(Get.find());

  @override
  void onInit() {
    email = Get.arguments["email"];
    formKey = GlobalKey<FormState>();
    firstPassword = TextEditingController();
    super.onInit();
  }

  @override
  void changePasswordVisibility() {
    passwordOneVisibility = !passwordOneVisibility;

    update();
  }

  @override
  void resetPassword() async {
    if (formKey.currentState!.validate()) {
      // requestStatus = RequestStatus.LOADING;
      // var response = await restPasswordData.postData(
      //     email: email, password: firstPassword.text);
      // requestStatus = HandlingResponseType.fun(response);
      // update();
      // if (requestStatus == RequestStatus.SUCCESS) {
      //   if (response["success"] == true) {
      Get.defaultDialog(
          title: "Success", middleText: "Password reseted successfully");
      //   } else {
      //     requestStatus = RequestStatus.FAILURE;
      //     Get.defaultDialog(
      //         title: "Error", middleText: "Something went wrong try again!");
      //   }
      // }
    }
  }
}
