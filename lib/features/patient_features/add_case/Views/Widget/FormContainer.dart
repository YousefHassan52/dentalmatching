import 'package:dentalmatching/core/services/my_services.dart';

import 'package:dentalmatching/features/patient_features/add_case/Views/Widget/FormBody.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormContainer extends GetView<MyServices> {
  const FormContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(3),
        padding: const EdgeInsets.all(10),
        width: Get.width * 0.93,
        child: FormBody());
  }
}
