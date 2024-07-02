// ignore_for_file: avoid_print, unnecessary_overrides

import 'dart:io';

import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/functions/handling_response_type.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/core/shared/dialogue_without_buttons.dart';
import 'package:dentalmatching/features/doctor_features/edit_specialization/controller/abstract_controller.dart';
import 'package:dentalmatching/features/doctor_features/edit_specialization/data/edit_specialization_data.dart';
import 'package:dentalmatching/features/doctor_features/signup/data/models/doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditSpecializationControllerImpl
    extends EditSpecializationControllerAbstract {
  late DoctorModel userModel =
      DoctorModel.fromSharedPref(myServices.sharedPref);
  File? imageFile;
  MyServices myServices = Get.find();
  late String role;

  RequestStatus? requestStatus;
  EditSpecializationData data = EditSpecializationData(Get.find());

  String? specialization;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
  }

  void pickImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      String filePath = image.path;
      String fileExtension = filePath.split('.').last.toLowerCase();

      // Check if the file extension is png, jpg, or jpeg
      if (fileExtension == 'png' ||
          fileExtension == 'jpg' ||
          fileExtension == 'jpeg') {
        imageFile = File(filePath);
        update(); // Update the UI after selecting an image
      } else {
        customDialoge(
            title: "Wrong Image Format".tr,
            middleText: "Make sure that your image file is PNG, JPG or JPEG".tr);
      }
    }
    update();
  }

  @override
  void editSpecialization() async {
    if (imageFile != null && formKey.currentState!.validate()) {
      requestStatus = RequestStatus.LOADING;
      update();
      var response = await data.postData(
          requiredFile: imageFile!,
          token: userModel.token,
          specialization: specialization!);
      requestStatus = HandlingResponseType.fun(response);
      update();
      print("response ya joooe:------ $response");
      if (requestStatus == RequestStatus.SUCCESS) {
        if (response["success"] == true) {
          customDialoge(
              title: "Request sent".tr,
              middleText:
                  "Your request to change your specialization sent successfully wait for admin approve".tr);
          update();
        }
      } else if (requestStatus == RequestStatus.UNAUTHORIZED_FAILURE) {
        customDialoge(title: "Warning".tr, middleText: "Unauthrized Error");
      } else {
        customDialoge(
            title: "Warning".tr, middleText: "Server Error Please Try Again");
      }

      update();
    } else {
      customDialoge(title: "Warning".tr, middleText: "No image selected".tr);
    }
  }
}
