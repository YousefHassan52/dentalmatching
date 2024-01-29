import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/features/common_faetures/forget_password/reset_password/controller/reset_password_controller_abstract.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ResetPasswordControllerImp extends ResetPasswordControllerAbstract {
  bool passwordOneVisibility = true;
  bool passwordTwoVisibility = true;
  late String email;

  late TextEditingController firstPasswordController;
  late TextEditingController secondPasswordController;
  late GlobalKey<FormState> formKey;

  RequestStatus? requestStatus;
  // RestPasswordData restPasswordData = RestPasswordData(Get.find());

  @override
  void onInit() {
    email = Get.arguments["email"];
    formKey = GlobalKey<FormState>();
    firstPasswordController = TextEditingController();
    secondPasswordController = TextEditingController();
    super.onInit();
  }

  @override
  void changePasswordVisibility({bool secondPass = false}) {
    if (secondPass == false) {
      passwordOneVisibility = !passwordOneVisibility;
    } else if (secondPass == true) {
      passwordTwoVisibility = !passwordTwoVisibility;
    }

    update();
  }

  @override
  void resetPassword() async {
    if (formKey.currentState!.validate() &&
        firstPasswordController.text == secondPasswordController.text) {
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
