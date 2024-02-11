import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/features/patient_features/AddCase/Controller/FormController.dart';
import 'package:dentalmatching/features/patient_features/AddCase/data/staticData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CasesChecklist extends StatelessWidget {
  const CasesChecklist({super.key});
  @override
  Widget build(BuildContext context) {
    StaticData list = StaticData();

    return GetBuilder<ChronicDiseasesController>(
      builder: (controller) {
        return Column(
          children: [
            for (int index = 0; index < list.knownCases.length; index++)
              Column(
                children: [
                  CheckboxListTile(
                    checkColor: AppColors.blueLightTextColor,
                    activeColor: Colors.transparent,
                    checkboxShape: const OvalBorder(),
                    title: Text(
                      list.knownCases[index].title,
                      style: Styles.textStyle16Grey,
                    ),
                    value: controller.checkedCase[index],
                    onChanged: (value) {
                      controller.handleCheckboxChangeCases(index, value!);
                    },
                    controlAffinity: ListTileControlAffinity
                        .leading, // Move the checkbox to the leading position
                    contentPadding:
                        const EdgeInsets.all(0), // Remove default padding
                    dense: true,
                  ),
                ],
              ),
          ],
        );
      },
    );
  }
}
