import 'package:dentalmatching/core/functions/validator.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/features/patient_features/Cases/Controller/FormController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NextButtonController extends GetxController {
  final ChronicDiseasesController cont = Get.put(ChronicDiseasesController());
  final MyServices controller = Get.put(MyServices());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  //late TextEditingController descriptionController;

  //  void validateChecklist() {
  //   if (!AppValidator.validate(cont.checkedItems)) {
  //     Get.snackbar(
  //       'Validation Error',
  //       'Please select at least one item in the checklist.',
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //     );
  //   } 
  // }

  handleButtonBehavior() {
    // bool noneSelected = true;

    // for (int i = 0; i < cont.checkedItems.length; i++) {
    //   if (cont.checkedItems[i]) {
    //     noneSelected = false;
    //     break;
    //   }
    // }

    // if (noneSelected) {
    //   // Automatically choose 'None'
    //   cont.handleCheckboxChange(5, true);
    //   Get.snackbar('ssd', 'None is Selected');
    // }
    if (formKey.currentState!.validate()) {
      if (!AppValidator.validateCheckbox(cont.checkedItems)) {
      Get.snackbar(
        'Validation Error',
        'Please select at least one item in the checklist.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP
        
      );
    } 
      if (cont.selected == 'Unkown') {
        controller.AddedCase();
        Get.snackbar('ssd', 'Cases Counter ${controller.casesCounter}');
      } else if (cont.selected == 'Known') {
        Get.snackbar('ssd', 'Known Case Form');
      } else {
        // Handle other cases as needed
        Get.snackbar('ssd', 'Choooseeee');
      }
    } else {
      return ' write';
    }
  }
}
