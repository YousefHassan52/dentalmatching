import 'dart:io';

import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/functions/handling_response_type.dart';
import 'package:dentalmatching/features/doctor_features/signup/controller/signup_doctor_controller_abstract.dart';
import 'package:dentalmatching/features/doctor_features/signup/data/signup_doctor_data.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignupDoctorControllerImpl extends SignupDoctorControllerAbstract {
  File? imageFile;
  RequestStatus? requestStatus;
  SignupDoctorData signupData = SignupDoctorData(Get.find());

  @override
  void signup() async {
    if (imageFile != null) {
      requestStatus = RequestStatus.LOADING;
      update();
      var response = await signupData.postData(
          age: 22,
          city: "Cairo",
          email: "doctor52beram@mail.com",
          phoneNumber: "01258564741",
          fullname: "doctor beram",
          gender: true,
          password: "Yousef@123",
          role: "Doctor",
          university: "Must University",
          fileImage: imageFile!);
      requestStatus = HandlingResponseType.fun(response);
      print("response ya joooe:------");
      // print(response);
      if (requestStatus == RequestStatus.SUCCESS) {
        if (response["success"] == true) {
          // user.addAll(response["data"]);
          Get.defaultDialog(middleText: "${response["data"]["email"]} ");

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
