import 'package:dentalmatching/features/patient_features/AddCase/Controller/FormController.dart';
import 'package:dentalmatching/features/patient_features/AddCase/Views/Widget/CasesCheckList.dart';
import 'package:dentalmatching/features/patient_features/AddCase/Views/Widget/RadioList.dart';
import 'package:dentalmatching/features/patient_features/AddCase/data/staticData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KnownCheckWidget extends StatelessWidget {
  const KnownCheckWidget({super.key});

  @override
  Widget build(BuildContext context) {
    StaticData list = StaticData();

    return GetBuilder<ChronicDiseasesController>(
      builder: (controller) {
        return RadioListWidget(
          cont: list.caseStatus,
          onChanged: (value) {
            controller.handleSelectionKnown(value!);
            if (value == 'Known') {
              Get.defaultDialog(title: '', content: CasesChecklist());
            }
          },
          groupValue: controller.selected,
        );
      },
    );
  }
}
