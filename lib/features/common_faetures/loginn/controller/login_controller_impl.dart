// ignore_for_file: avoid_print

import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/constants/routes_names.dart';
import 'package:dentalmatching/core/functions/handling_response_type.dart';
import 'package:dentalmatching/core/services/my_services.dart';
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

  MyServices myServices =
      Get.find(); // ma3molo put fe el main fa 2a2der 2 find_oh hena 3ady

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
          if (response["data"]["role"].toLowerCase() ==
              "doctor".toLowerCase()) {
            myServices.saveDoctorModelToSharedPrefrence(response);
            Get.offAllNamed(AppRoutes.homeDoctor);
          }
          if (response["data"]["role"].toLowerCase() ==
              "Patient".toLowerCase()) {
            myServices.savePatientModelToSharedPrefrence(response);
            Get.offAllNamed(AppRoutes.homePatient);
          }
          if (response["data"]["role"].toLowerCase() ==
              "AdminDoctor".toLowerCase()) {
            myServices.saveAdminDoctorModelToSharedPrefrence(response);
            Get.offAllNamed(AppRoutes.adminDoctorHome);
          }
        }
      } else if (requestStatus == RequestStatus.UNAUTHORIZED_FAILURE) {
        Get.defaultDialog(
            title: "Alert".tr,
            middleText: "Incorrect Phone Number or Password".tr);
      } else if (requestStatus == RequestStatus.UNVERIFIED_DOCTOR_FAILURE) {
        Get.defaultDialog(
            title: "Identity Verification In Progress".tr,
            middleText: "Please Wait for Identity Verification".tr);
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
