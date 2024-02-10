import 'dart:io';

import 'package:dentalmatching/core/functions/validator.dart';
import 'package:dentalmatching/features/patient_features/AddCase/data/staticData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChronicDiseasesController extends GetxController {
  StaticData list = StaticData();
  List<bool> checkedItems = List.generate(6, (index) => false);
  List<bool> checkedCase = List.generate(6, (index) => false);
  bool showPressureChecklist = false;
  String pressure = '';
  String selected = '';
 late TextEditingController descriptionController;
 File? imageFile;
 List<String> selectedTitles = [];
 List<String> selectedCases = [];


  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void onInit() {
    descriptionController = TextEditingController();

    super.onInit();
  }

  void handleCheckboxChange(int index, bool value) {
    checkedItems[index] = value;
    if (list.chronicDiseases[index].title == 'Hypertension') {
      showPressureChecklist = value;
    }
    selectedTitles = [];
    for (int i = 0; i < checkedItems.length; i++) {
      if (checkedItems[i]) {
        selectedTitles.add(list.chronicDiseases[i].title);
      }
    }
    update();
  }

  void handleCheckboxChangeCases(int index, bool value) {
    checkedCase[index] = value;
    selectedCases = [];
    for (int i = 0; i < checkedCase.length; i++) {
      if (checkedCase[i]) {
        selectedCases.add(list.knownCases[i].title);
      }
    }
    print('Selected Titles: $selectedCases');
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
        middleText: 'Please select at least one item in the checklist.',
        backgroundColor: Colors.red,
      );
      return false; // Validation failed
    }
    return true; // Validation passed
  }

  bool caseValidation() {
    if (selected.isEmpty) {
      Get.defaultDialog(
        middleText: 'Please select your case.',
        backgroundColor: Colors.red,
      );
      return false; // Validation failed
    }
    return true; // Validation passed
  }

  handleButtonBehavior() {
    if (formKey.currentState!.validate() &&
        pressureValidation() &&
        checkBoxValidation() &&
        caseValidation()) {
      Get.defaultDialog(
          middleText: '${pressure}'
              '\n'
              '${selected}'
              '\n'
              'Checked Items: ${selectedTitles.join(", ")}'
              '\n'
              'Checked Items: ${selectedCases.join(", ")}'
          //'${cont.chronicDiseases.}'
          );
    }
  }
}
