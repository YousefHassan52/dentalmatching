import 'dart:io';

import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/functions/handling_response_type.dart';
import 'package:dentalmatching/core/functions/validator.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/features/patient_features/AddCase/data/add_case_data.dart';
import 'package:dentalmatching/features/patient_features/AddCase/data/staticData.dart';
import 'package:dentalmatching/features/patient_features/signup/data/model/patient_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddCaseController extends GetxController {
  late PatientModel patientModel =
      PatientModel.fromSharedPref(myServices.sharedPref);
  MyServices myServices = Get.find();
  late PatientModel userModel;
  AddCaseData addCaseData = AddCaseData(Get.find());
  RequestStatus? requestStatus;

  StaticData list = StaticData();
  List<bool> checkedItems = List.generate(6, (index) => false);
  List<bool> checkedCase = List.generate(10, (index) => false);
  bool showPressureChecklist = false;
  String pressure = '';
  String selected = '';
  late TextEditingController descriptionController;
  File? imageFile;
  List<String> selectedChronicDiseases = [];
  List<String> selectedDentalCases = [];
  List<File>? mouthImages = [];
  Future<void> pickMouthImages() async {
    List<XFile>? xFiles = await ImagePicker().pickMultiImage(
      imageQuality: 70, // Adjust image quality as needed
    );

    List<File> files = [];
    for (XFile xFile in xFiles) {
      files.add(File(xFile.path));
    }

    mouthImages = files;
    update();
  }

  List<File>? xray = [];
  Future<void> pickXrayImages() async {
    List<XFile>? xFiles = await ImagePicker().pickMultiImage(
      imageQuality: 70, // Adjust image quality as needed
    );

    List<File> files = [];
    for (XFile xFile in xFiles) {
      files.add(File(xFile.path));
    }

    xray = files;
    update();
  }

  List<File>? prescription = [];
  Future<void> pickPrescriptionImages() async {
    List<XFile>? xFiles = await ImagePicker().pickMultiImage(
      imageQuality: 70, // Adjust image quality as needed
    );

    List<File> files = [];
    for (XFile xFile in xFiles) {
      files.add(File(xFile.path));
    }

    prescription = files;
    update();
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void onInit() {
    descriptionController = TextEditingController();
    userModel = PatientModel.fromSharedPref(myServices.sharedPref);

    super.onInit();
  }

  void handleCheckboxChange(int index, bool value) {
    checkedItems[index] = value;
    // if (list.chronicDiseases[index].title == 'Hypertension') {
    //   showPressureChecklist = value;
    // }
    //homa 3amlen el selection optional ya jooooo
    selectedChronicDiseases = [];
    for (int i = 0; i < checkedItems.length; i++) {
      if (checkedItems[i]) {
        selectedChronicDiseases.add(list.chronicDiseases[i].title);
        print('Selected Titles: $selectedChronicDiseases');
      }
    }
    update();
  }

  void handleCheckboxChangeCases(int index, bool value) {
    checkedCase[index] = value;
    selectedDentalCases = [];
    for (int i = 0; i < checkedCase.length; i++) {
      if (checkedCase[i]) {
        selectedDentalCases.add(list.knownCases[i].title);
      }
    }
    print('Selected Titles: $selectedDentalCases');
    update();
  }

  void handleSelectionKnown(String value) {
    selected = value;
    update();
  }

  void handleSelectionPressure(String value) {
    pressure = value;
    update();
  }

//Validations

  bool pressureValidation() {
    if (showPressureChecklist && pressure.isEmpty) {
      Get.defaultDialog(
        title: 'Alert',
        middleText: 'Please select your Pressure Level.',
        backgroundColor: Colors.red,
      );
      return false; // Validation failed
    }
    return true; // Validation passed
  }

  bool checkBoxValidation() {
    if (!AppValidator.validateCheckbox(checkedItems)) {
      Get.defaultDialog(
        title: 'Alert',
        middleText: 'Please select at least one item in the checklist.'.tr,
        backgroundColor: Colors.red,
      );
      return false; // Validation failed
    }
    return true; // Validation passed
  }

  bool caseValidation() {
    if (selected.isEmpty) {
      Get.defaultDialog(
        title: 'Alert',
        middleText: 'Please select your case.'.tr,
        backgroundColor: Colors.red,
      );
      return false; // Validation failed
    }
    return true; // Validation passed
  }

  bool mouthImagesValidation() {
    if (mouthImages != null && mouthImages!.length >= 2) {
      return true;
    } else {
      Get.defaultDialog(
        title: 'Alert',
        middleText: 'Please select more than 2 images for your mouth.'.tr,
        backgroundColor: Colors.red,
      );
      return false;
    }
  }

  bool xrayValidation() {
    if (xray != null && xray!.length > 2) {
      Get.defaultDialog(
        title: 'Alert',
        middleText: 'Maximum Number of X_ray Images is 2'.tr,
        backgroundColor: Colors.red,
      );
      return false;
    } else {
      return true;
    }
  }

  bool prescriptionValidation() {
    if (prescription != null && prescription!.length > 2) {
      Get.defaultDialog(
        title: 'Alert',
        middleText: 'Maximum Number of Prescription Images is 2'.tr,
        backgroundColor: Colors.red,
      );
      return false;
    } else {
      return true;
    }
  }

  Future<void> postCase() async {
    if (formKey.currentState!.validate() &&
        pressureValidation() &&
        checkBoxValidation() &&
        mouthImagesValidation() &&
        xrayValidation() &&
        prescriptionValidation() &&
        caseValidation()) {
      requestStatus = RequestStatus.LOADING;
      update();
      var response = await addCaseData.postData(
        data: {
          "description": descriptionController.text,

          //    dental diseases list
          ...selectedDentalCases.isNotEmpty
              ? {
                  ...selectedDentalCases.asMap().map((index, disease) =>
                      MapEntry('dentalDiseases[$index]', disease)),
                }
              : {},

          // known || unknown
          "isKnown": selectedDentalCases.isNotEmpty ? true : false,

          //   chronic diseases list
          ...selectedChronicDiseases.asMap().map(
              (index, disease) => MapEntry('chronicDiseases[$index]', disease)),
        },
        token: userModel.token,
        mouthImages: mouthImages,
        xrayImages: xray,
        prescriptionImages: prescription,
      );
      print(response.toString());
      requestStatus = HandlingResponseType.fun(response);
      print("joe ;${requestStatus.toString()}");
      update();
      if (requestStatus == RequestStatus.SUCCESS) {
        if (response['success'] == true) {
          Get.defaultDialog(
              title: "Success ".tr,
              middleText: "Your Case Posted Successfully".tr);
          print(response);
        }
      } else if (requestStatus == RequestStatus.UNAUTHORIZED_FAILURE) {
        Get.defaultDialog(middleText: "Unauthorize Error Please Try Again..");
      } else {
        Get.defaultDialog(middleText: "Server Error Please Try Again");
      }
    }
  }
}
