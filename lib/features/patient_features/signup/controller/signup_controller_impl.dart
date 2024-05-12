import 'dart:io';

import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/constants/routes_names.dart';
import 'package:dentalmatching/core/functions/handling_response_type.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/features/patient_features/signup/data/signup_patient_data.dart';
import 'package:dentalmatching/features/patient_features/signup/controller/signup_controller_asbtract.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignupPatientControllerImpl extends SignupPatientControllerAbstract {
  File? imageFile;
  bool notVisible = true;
  late TextEditingController fullNameController;
  late TextEditingController ageController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  late TextEditingController addressController;
  String? gov;
  String? gender;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  MyServices myServices = Get.find();
  RequestStatus? requestStatus;
  SignupPatientData signupData =
      SignupPatientData(Get.find()); // get.find related to CRUD

  @override
  void signup() async {
    if (formKey.currentState!.validate()) {
      requestStatus = RequestStatus.LOADING;
      update();
      var response = await signupData.postData(
        fullname: fullNameController.text,
        email: emailController.text,
        gender: gender == "Male" || gender == "ذكر" ? true : false,
        age: int.parse(ageController.text),
        government: gov!,
        password: passwordController.text,
        phoneNumber: phoneController.text,
        role: "Patient",
        address: addressController.text, // mtnsa4 tezawedha fe el screen ya joe
      );
      requestStatus = HandlingResponseType.fun(response);
      print("response ya joooe:------");
      // print(response);
      if (requestStatus == RequestStatus.SUCCESS) {
        if (response["success"] == true) {
          // user.addAll(response["data"]);

          myServices.savePatientModelToSharedPrefrence(response);
          Get.offAllNamed(AppRoutes.homePatient);

          // go to home
        }
      } else if (requestStatus == RequestStatus.UNAUTHORIZED_FAILURE) {
        Get.defaultDialog(middleText: "Email or Phone Already exists before");
      } else if (requestStatus == RequestStatus.BLOCKED_USER) {
        Get.defaultDialog(
          title: "Blocked User",
          middleText:
              "You have been blocked by many doctors more than 4 times due to your bad attitude",
        );
      } else {
        Get.defaultDialog(middleText: "Server Error Please Try Again");
      }

      update();
    }
  }

  @override
  void onInit() {
    fullNameController = TextEditingController();
    ageController = TextEditingController();

    phoneController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    addressController = TextEditingController();

    super.onInit();
  }

  void changePasswordVisibility() {
    notVisible = !notVisible;
    update();
  }

  void pickImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      imageFile = File(image.path);
      update(); // Update the UI after selecting an image
    } else {
      print('No image selected.');
    }
    update();
  }
}
