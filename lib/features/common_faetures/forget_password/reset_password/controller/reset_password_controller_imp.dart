import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/functions/block_action.dart';
import 'package:dentalmatching/core/functions/handling_response_type.dart';
import 'package:dentalmatching/core/shared/dialogue_without_buttons.dart';
import 'package:dentalmatching/features/common_faetures/forget_password/reset_password/controller/reset_password_controller_abstract.dart';
import 'package:dentalmatching/features/common_faetures/forget_password/reset_password/data/reset_password_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordControllerImp extends ResetPasswordControllerAbstract {
  bool passwordOneVisibility = true;
  bool passwordTwoVisibility = true;
  late String email;

  late TextEditingController firstPasswordController;
  late TextEditingController secondPasswordController;
  late GlobalKey<FormState> formKey;

  RequestStatus? requestStatus;
  ResetPasswordData modelData = ResetPasswordData(Get.find());
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
      requestStatus = RequestStatus.LOADING;
      update();
      var response = await modelData.postData(
          email: email, password: firstPasswordController.text);
      requestStatus = HandlingResponseType.fun(response);
      update();
      if (requestStatus == RequestStatus.SUCCESS) {
        if (response["success"] == true) {
          customDialoge(
            title: "Success".tr,
            middleText: "Password Reseted Successfully".tr,
          );
        }
      } else if (requestStatus ==
          RequestStatus
              .UNAUTHORIZED_FAILURE) // status code 400 (Email not found)
      {
        customDialoge(
            title: "Warning".tr, middleText: "Verification Code is Expired".tr);
      } else if (requestStatus == RequestStatus.BLOCKED_USER) {
        blockAction();
      } else {
        customDialoge(
            title: "Warning".tr, middleText: "Server Error Please Try Again");
      }
    }
  }
}
