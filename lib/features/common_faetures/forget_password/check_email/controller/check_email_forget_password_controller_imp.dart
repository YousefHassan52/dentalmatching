import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/constants/routes_names.dart';
import 'package:dentalmatching/core/functions/handling_response_type.dart';
import 'package:dentalmatching/features/common_faetures/forget_password/check_email/controller/check_email_forget_password_controller_abstract.dart';
import 'package:dentalmatching/features/common_faetures/forget_password/check_email/data/check_email_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckEmailForgetPasswordControllerImp
    extends CheckEmailForgetPasswordControllerAbstract {
  CheckEmailForgetPasswordData checkEmailData =
      CheckEmailForgetPasswordData(Get.find());
  late TextEditingController emailController;
  RequestStatus? requestStatus;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    emailController = TextEditingController();
    formKey = GlobalKey<FormState>();
    super.onInit();
  }

  @override
  void checkEmail() async {
    print(emailController.text);
    if (formKey.currentState!.validate()) {
//       initialize request status
      requestStatus = RequestStatus.LOADING;
      update();
      var response = await checkEmailData.postData(email: emailController.text);
      print(response.toString());
      requestStatus = HandlingResponseType.fun(response);
      update();
      if (requestStatus == RequestStatus.SUCCESS) {
        if (response['success'] == true) {
          goToVerifyCodeScreen();
        }
      } else if (requestStatus ==
          RequestStatus
              .UNAUTHORIZED_FAILURE) // status code 400 (Email not found)
      {
        Get.defaultDialog(title: "Try Again".tr, middleText: "Email Not Found".tr);
      } else {
        Get.defaultDialog(middleText: "Server Error Please Try Again");
      }
    }
  }

  void goToVerifyCodeScreen() {
    Get.toNamed(AppRoutes.verifyEmailForgetPassword,
        arguments: {"email": emailController.text});
  }
}
