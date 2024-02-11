import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/features/patient_features/AddCase/Controller/FormController.dart';
import 'package:dentalmatching/features/patient_features/AddCase/Views/Widget/RadioList.dart';
import 'package:dentalmatching/features/patient_features/AddCase/data/staticData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChronicDiseasesChecklist extends StatelessWidget {
  const ChronicDiseasesChecklist({super.key});
  @override
  Widget build(BuildContext context) {
    StaticData list = StaticData();
    return GetBuilder<ChronicDiseasesController>(
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
                      list.chronicDiseases[index].title,
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
