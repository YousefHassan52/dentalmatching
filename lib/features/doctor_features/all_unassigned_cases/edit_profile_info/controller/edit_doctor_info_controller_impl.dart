import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/functions/handling_response_type.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/features/doctor_features/doctor_data_viewer/doctor_data_controller.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/edit_profile_info/controller/edit_doctor_info_controller_abstract.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/edit_profile_info/data/edit_doctor_info_data.dart';
import 'package:dentalmatching/features/doctor_features/signup/data/models/doctor_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditDoctorInfoControllerImp extends EditDoctortInfoControllerAbstract {
  MyServices myServices = Get.find();
  late DoctorModel userModel =
      DoctorModel.fromSharedPref(myServices.sharedPref);
  EditDoctorInfoData data = EditDoctorInfoData(Get.find());

  late TextEditingController fullNameController;
  late TextEditingController ageController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController universityController;
  String? gov;
  String? gender;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RequestStatus? requestStatus;

  @override
  Future<void> editDoctorInfo() async {
    if (formKey.currentState!.validate()) {
      requestStatus = RequestStatus.LOADING;
      update();
      var response = await data.postData(
        token: userModel.token,
        fullname: fullNameController.text,
        userName: userModel.userName,
        email: emailController.text,
        gender: gender == "Male" ? true : false,
        age: int.parse(ageController.text),
        government: gov!,
        phoneNumber: phoneController.text,
        university:
            universityController.text, // mtnsa4 tezawedha fe el screen ya joe
      );
      requestStatus = HandlingResponseType.fun(response);
      print("response ya joooe:------ $response");
      // print(response);
      if (requestStatus == RequestStatus.SUCCESS) {
        if (response["success"] == true) {
          Get.snackbar("Updated Successfully",
              "Your account info has been updatedd successfully");

          userModel = DoctorModel(
              university: universityController.text,
              userName: userModel.userName,
              token: userModel.token,
              fullName: fullNameController.text,
              email: emailController.text,
              age: int.parse(ageController.text),
              gender: gender == "Male" ? true : false,
              city: gov!,
              phoneNumber: phoneController.text,
              role: userModel.role);
          DoctorDataController doctorDataController =
              Get.put(DoctorDataController());
          doctorDataController.updateDoctordata(userModel.toJson());
        }
      } else if (requestStatus == RequestStatus.UNAUTHORIZED_FAILURE) {
        Get.defaultDialog(middleText: "Email or Phone Already exists before");
      } else {
        Get.defaultDialog(middleText: "Server Error Please Try Again");
      }

      update();
      // print(fullNameController.text);
      // print(emailController.text);
      // print(phoneController.text);
      // print(ageController.text);
      // print(addressController.text);
      // print(gender);
      // print(gov);
      // print(userModel.userName);

      // print(myServices.sharedPref.getString("phoneNumber"));
      // print(myServices.sharedPref.getBool("logged"));
      // print("--------------------------------------");
      // print(userModel.email);
    }
  }

  @override
  void onInit() {
    gov = userModel.city;
    gender = userModel.gender == true ? "Male" : "Female";
    fullNameController = TextEditingController(text: userModel.fullName);
    ageController = TextEditingController(text: userModel.age.toString());
    phoneController = TextEditingController(text: userModel.phoneNumber);
    emailController = TextEditingController(text: userModel.email);
    universityController = TextEditingController(text: userModel.university);
    super.onInit();
  }
}
