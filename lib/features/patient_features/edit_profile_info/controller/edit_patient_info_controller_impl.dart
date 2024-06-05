import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/functions/block_action.dart';
import 'package:dentalmatching/core/functions/handling_response_type.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/core/shared/dialogue_without_buttons.dart';
import 'package:dentalmatching/features/patient_features/edit_profile_info/controller/edit_patient_info_controller_abstract.dart';
import 'package:dentalmatching/features/patient_features/edit_profile_info/data/edit_patient_info_data.dart';
import 'package:dentalmatching/features/patient_features/patient_data_viewer/pateint_data_controller.dart';
import 'package:dentalmatching/features/patient_features/signup/data/model/patient_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditPatientInfoControllerImp extends EditPatientInfoControllerAbstract {
  MyServices myServices = Get.find();
  late PatientModel userModel =
      PatientModel.fromSharedPref(myServices.sharedPref);
  EditPatientInfoData data = EditPatientInfoData(Get.find());

  late TextEditingController fullNameController;
  late TextEditingController ageController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController addressController;
  String? gov;
  String? gender;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RequestStatus? requestStatus;

  @override
  Future<void> editPatientInfo() async {
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
        address: addressController.text, // mtnsa4 tezawedha fe el screen ya joe
      );
      requestStatus = HandlingResponseType.fun(response);
      print("response ya joooe:------ $response");
      // print(response);
      if (requestStatus == RequestStatus.SUCCESS) {
        if (response["success"] == true) {
          Get.snackbar("Updated Successfully",
              "Your account info has been updatedd successfully");

          userModel = PatientModel(
              userName: userModel.userName,
              address: addressController.text,
              token: userModel.token,
              fullName: fullNameController.text,
              email: emailController.text,
              age: int.parse(ageController.text),
              gender: gender == "Male" || gender == "ذكر" ? true : false,
              city: gov!,
              phoneNumber: phoneController.text,
              role: "Patient");
          PatientDataController pateintDataController =
              Get.put(PatientDataController());
          // if success
          pateintDataController.updatePatientdata(userModel.toJson());
        }
      } else if (requestStatus == RequestStatus.UNAUTHORIZED_FAILURE) {
        customDialoge(
            title: "Warning".tr,
            middleText: "Email or Phone Already exists before");
      } else if (requestStatus == RequestStatus.BLOCKED_USER) {
        blockAction();
      } else {
        customDialoge(
            title: "Try Again".tr, middleText: "Server Error Please Try Again");
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
    addressController = TextEditingController(text: userModel.address);
    super.onInit();
  }
}
