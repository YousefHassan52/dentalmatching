import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/features/patient_features/add_case/Views/Widget/radio_list.dart';
import 'package:dentalmatching/features/patient_features/add_case/data/staticData.dart';
import 'package:dentalmatching/features/patient_features/edit_case/controller/editCaseController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditChronicDiseasesChecklist extends StatelessWidget {
  const EditChronicDiseasesChecklist({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    StaticData list = StaticData();
    return GetBuilder<EditCaseController>(
      builder: (controller) {
        return Column(
          children: [
            for (int index = 0; index < list.chronicDiseases.length; index++)
              Column(
                children: [
                  CheckboxListTile(
                    checkColor: AppColors.blueLightTextColor,
                    activeColor: Colors.transparent,
                    checkboxShape: const OvalBorder(),
                    title: Text(
                      list.chronicDiseases[index].title.tr,
                      style: Styles.textStyle16Grey,
                    ),
                    value: controller.checkedItems[index],
                    onChanged: (value) {
                      controller.handleCheckboxChange(index, value!);
                    },
                    controlAffinity: ListTileControlAffinity
                        .leading, // Move the checkbox to the leading position
                    contentPadding:
                        const EdgeInsets.all(0), // Remove default padding
                    dense: true,
                  ),
                  if (controller.showPressureChecklist &&
                      list.chronicDiseases[index].title == 'Hypertension')
                    RadioListWidget(
                      cont: list.pressureLevels,
                      onChanged: (value) {
                        controller.handleSelectionPressure(value!);
                      },
                      groupValue: controller.pressure,
                    ),
                ],
              ),
          ],
        );
      },
    );
  }
}
