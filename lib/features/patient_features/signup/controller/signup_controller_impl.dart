import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/functions/handling_response_type.dart';
import 'package:dentalmatching/features/patient_features/signup/data/signup_patient_data.dart';
import 'package:dentalmatching/features/patient_features/signup/controller/signup_controller_asbtract.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupPatientControllerImpl extends SignupPatientControllerAbstract {
  bool notVisible = true;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController ageController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  late TextEditingController chronicDiseasesController;
  String? gov;
  String? gender;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RequestStatus? requestStatus;
  SignupPatientData signupData =
      SignupPatientData(Get.find()); // get.find related to CRUD

  @override
  void signup() async {
    if (formKey.currentState!.validate()) {
      requestStatus = RequestStatus.LOADING;
      update();
      var response = await signupData.postData(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        gender: gender == "Male" ? true : false,
        age: int.parse(ageController.text),
        government: gov!,
        password: passwordController.text,
        phoneNumber: phoneController.text,
        role: "Patient",
        chronicDiseases: chronicDiseasesController.text.isNotEmpty
            ? chronicDiseasesController.text
            : "None", // mtnsa4 tezawedha fe el screen ya joe
      );
      requestStatus = HandlingResponseType.fun(response);
      print("response ya joooe:------");
      // print(response);
      if (requestStatus == RequestStatus.SUCCESS) {
        if (response["success"] == true) {
          // user.addAll(response["data"]);
          Get.defaultDialog(
              middleText:
                  "${response["data"]["email"]} and ${passwordController.text}}");
          firstNameController.clear();
          lastNameController.clear();
          ageController.clear();
          emailController.clear();
          phoneController.clear();
          passwordController.clear();
          chronicDiseasesController.clear();

          // go to home
        }
      } else if (requestStatus == RequestStatus.UNAUTHORIZED_FAILURE) {
        Get.defaultDialog(middleText: "Email or Phone Already exists before");
      } else {
        Get.defaultDialog(middleText: "Server Error Please Try Again");
      }

      update();
    }
  }

  @override
  void onInit() {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    ageController = TextEditingController();

    phoneController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    chronicDiseasesController = TextEditingController();
    super.onInit();
  }

  void changePasswordVisibility() {
    notVisible = !notVisible;
    update();
  }
}
