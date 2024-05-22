import 'dart:io';
import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/functions/handling_response_type.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/features/doctor_features/signup/controller/signup_doctor_controller_abstract.dart';
import 'package:dentalmatching/features/doctor_features/signup/data/signup_doctor_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignupDoctorControllerImpl extends SignupDoctorControllerAbstract {
  // textform fields
  bool notVisible = true;
  late TextEditingController fullNameController;
  late TextEditingController ageController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  late TextEditingController universityController;
  String? gov;
  String? gender;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  //-------------------------------------------------------------
  MyServices myServices = Get.find();

  File? imageFile;
  RequestStatus? requestStatus;
  SignupDoctorData signupData = SignupDoctorData(Get.find());

  @override
  void onInit() {
    fullNameController = TextEditingController();
    ageController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    universityController = TextEditingController();
    super.onInit();
  }

  @override
  void signup() async {
    if (formKey.currentState!.validate() && imageFile != null) {
      requestStatus = RequestStatus.LOADING;
      update();
      var response = await signupData.postData(
          age: int.parse(ageController.text),
          city: gov!,
          email: emailController.text,
          phoneNumber: phoneController.text,
          fullname: fullNameController.text,
          gender: gender == "Male" || gender == "ذكر" ? true : false,
          password: passwordController.text,
          role: "Doctor",
          university: universityController.text,
          fileImage: imageFile!);
      requestStatus = HandlingResponseType.fun(response);
      print("response ya joooe:------");
      // print(response);
      if (requestStatus == RequestStatus.SUCCESS) {
        if (response["success"] == true) {
          Get.defaultDialog(
            title: "Success".tr,
            content: Column(
              children: [
                 SizedBox(
                  height: 100,
                  width: 100,
                   child: SvgPicture.asset(
                      'assets/svg/id.svg'),
                 ), 
                Center(child: Text("Your Account Has Been Created Successfully\nPlease Wait For Identity Verification".tr)),
                const SizedBox(
                    height:
                        10), // Adjust spacing between text and image as needed
                // Replace 'your_image.png' with your actual image file path
              ],
            ),
          );
          Future.delayed(const Duration(seconds: 10), () {
            Get.back(); // Dismisses the dialog
          });
          // Get.defaultDialog(
          //   title: "Success".tr,
          //   middleText:
          //       "Your Account Has Been Created Successfully\nPlease Wait For Identity Verification".tr,
          // );
        }
      } else if (requestStatus == RequestStatus.UNAUTHORIZED_FAILURE) {
        Get.defaultDialog(middleText: "Email or Phone Already exists before".tr);
      } else {
        Get.defaultDialog(middleText: "Server Error Please Try Again");
      }

      update();
    }
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

  void changePasswordVisibility() {
    notVisible = !notVisible;
    update();
  }
}
