import 'package:dentalmatching/core/services/my_services.dart';

import 'package:dentalmatching/features/patient_features/edit_case/view/widgets/edit_form_body.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditCaseFormContainer extends GetView<MyServices> {
  const EditCaseFormContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(3),
        padding: const EdgeInsets.all(10),
        width: Get.width * 0.93,
        // decoration: BoxDecoration(
        //   color: const Color.fromARGB(77, 207, 216, 220),
        //   borderRadius: BorderRadius.circular(20),
        //   border: Border.all(
        //     color: const Color(0xff4A6BAD),
        //   ),
        // ),
        child: const EditFormBody());
  }
}
