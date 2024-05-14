import 'package:dentalmatching/features/patient_features/add_case/Views/Widget/radio_list.dart';
import 'package:dentalmatching/features/patient_features/add_case/data/staticData.dart';
import 'package:dentalmatching/features/patient_features/edit_case/controller/editCaseController.dart';
import 'package:dentalmatching/features/patient_features/edit_case/view/widgets/edit_cases_check_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditKnownCheckWidget extends StatelessWidget {
  const EditKnownCheckWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StaticData list = StaticData();

    return GetBuilder<EditCaseController>(
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
                          const EditCasesChecklist(),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (value == 'Unknown' || value == 'لا ااعلم') {
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
