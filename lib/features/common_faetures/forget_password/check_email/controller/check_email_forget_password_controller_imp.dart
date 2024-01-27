import 'package:dentalmatching/core/constants/routes_names.dart';
import 'package:dentalmatching/features/common_faetures/forget_password/check_email/controller/check_email_forget_password_controller_abstract.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckEmailForForgetPasswordControllerImp
    extends ForgetPasswordControllerAbstract {
  // CheckEmailForForgetPasswordData checkEmailData = CheckEmailForForgetPasswordData(Get.find());
  late TextEditingController emailController;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
//  RequestStatus? requestStatus;

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
      // initialize request status
      // requestStatus = RequestStatus.LOADING;
      // var response = await checkEmailData.postData(email: emailController.text);
      // print(response.toString());
      // requestStatus = HandlingResponseType.fun(response);
      // update();
      // if (requestStatus == RequestStatus.SUCCESS) {
      //   if (response['success'] == true) {
      goToVerifyCodeScreen();
      //   } else {
      //     Get.defaultDialog(title: "Try Again", middleText: "Email Not Found");
      //     requestStatus = RequestStatus.FAILURE;
      //     update();
      //   }
      // }
    }
  }

  void goToVerifyCodeScreen() {
    Get.offAllNamed(AppRoutes.verifyEmailForgetPassword,
        arguments: {"email": emailController.text});
  }
}
