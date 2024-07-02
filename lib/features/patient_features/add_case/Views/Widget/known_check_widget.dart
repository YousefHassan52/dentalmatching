
// ignore_for_file: avoid_print

import 'package:dentalmatching/features/patient_features/add_case/controller/add_case_controller.dart';
import 'package:dentalmatching/features/patient_features/add_case/views/Widget/cases_check_list.dart';
import 'package:dentalmatching/features/patient_features/add_case/views/Widget/radio_list.dart';
import 'package:dentalmatching/features/patient_features/add_case/data/staticData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KnownCheckWidget extends StatelessWidget {
  const KnownCheckWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StaticData list = StaticData();

    return GetBuilder<AddCaseController>(
      builder: (controller) {
        return RadioListWidget(
          cont: list.caseStatus,
          onChanged: (value) {
            controller.handleSelectionKnown(value!);
            if (value == 'Known' || value == 'اعلم') {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Dental Cases'.tr,
                            style: const TextStyle(fontSize: 20),
                          ),
                          const CasesChecklist(),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (value == 'Unknown' || value == 'لا اعلم') {
              controller.selectedDentalCases = [];
              print(controller.selectedDentalCases);
            }
          },
          groupValue: controller.selected,
        );
      },
    );
  }
}
