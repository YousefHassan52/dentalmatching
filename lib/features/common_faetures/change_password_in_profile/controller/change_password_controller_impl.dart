import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/functions/block_action.dart';
import 'package:dentalmatching/core/functions/handling_response_type.dart';
import 'package:dentalmatching/features/common_faetures/change_password_in_profile/controller/change_password_controller_abstract.dart';
import 'package:dentalmatching/features/common_faetures/change_password_in_profile/data/change_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordControllerImpl extends ChangePasswordControllerAbstract {
  late String token;
  late String email;
  ChangePasswordData changePasswordData = ChangePasswordData(Get.find());
  RequestStatus? requestStatus;

  bool currentPasswordnotVisible = true;
  bool newPasswordnotVisible = true;
  late TextEditingController currentPasswordController;
  late TextEditingController newPasswordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    token = Get.arguments["token"];
    email = Get.arguments["email"];

    formKey = GlobalKey<FormState>();
    currentPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    super.onInit();
  }

  @override
  void changePassword() async {
    if (formKey.currentState!.validate()) {
      requestStatus = RequestStatus.LOADING;
      update();
      var response = await changePasswordData.changePassword(
          currentPassword: currentPasswordController.text,
          newPassword: newPasswordController.text,
          token: token);
      print(response.toString());
      requestStatus = HandlingResponseType.fun(response);
      update();
      print("joe ;${requestStatus.toString()}");
      if (requestStatus == RequestStatus.SUCCESS) {
        Get.snackbar("Success".tr, "Your passsword has been changed successfully".tr);
      } else if (requestStatus == RequestStatus.UNAUTHORIZED_FAILURE) {
        Get.defaultDialog(middleText: "Your current password is wrong".tr);
      } else if (requestStatus == RequestStatus.BLOCKED_USER) {
        blockAction();
      } else {
        Get.defaultDialog(middleText: "Server Error Please Try Again");
      }

      update();
    }
  }

  void changeCurrentPasswordVisibility() {
    currentPasswordnotVisible = !currentPasswordnotVisible;
    update();
  }

  void changeNewPasswordVisibility() {
    newPasswordnotVisible = !newPasswordnotVisible;
    update();
  }
}
