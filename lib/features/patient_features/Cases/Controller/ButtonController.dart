import 'package:dentalmatching/core/functions/validator.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/features/patient_features/Cases/Controller/FormController.dart';
import 'package:dentalmatching/features/patient_features/Cases/Views/Widget/Check.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NextButtonController extends GetxController {
  final ChronicDiseasesController cont = Get.put(ChronicDiseasesController());
  final MyServices controller = Get.put(MyServices());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  handleButtonBehavior() {
  
    if (formKey.currentState!.validate()) {
      if (!AppValidator.validateCheckbox(cont.checkedItems)) {
        Get.defaultDialog(
            middleText: 'Please select at least one item in the checklist.',
            backgroundColor: Colors.red,
            // colorText: Colors.white,
            );
      }
      if (cont.showPressureChecklist.value && cont.pressure.isEmpty) {
        Get.defaultDialog(
            middleText: 'Please select your Pressure Level.',
            backgroundColor: Colors.red,
            // colorText: Colors.white,
            );
      }
      if (!cont.selected.isNotEmpty) {
        Get.defaultDialog(
            middleText: 'Please select your case.',
            backgroundColor: Colors.red,
            // colorText: Colors.white,
            );
      }
      if (cont.selected == 'Unkown') {
        controller.AddedCase();
        Get.snackbar('ssd', 'Cases Counter ${controller.casesCounter}');
      } else if (cont.selected == 'Known') {
        
      } 
     
    }
     Get.defaultDialog(
      middleText: 
      '${cont.pressure}'
       '\n'
      '${cont.selected}'
      //'${cont.chronicDiseases.}'
     );
  }
}
