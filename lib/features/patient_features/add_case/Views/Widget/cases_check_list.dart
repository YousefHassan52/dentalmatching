import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/features/patient_features/add_case/controller/add_case_controller.dart';
import 'package:dentalmatching/features/patient_features/add_case/data/staticData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CasesChecklist extends StatelessWidget {
  const CasesChecklist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StaticData list = StaticData();

    return GetBuilder<AddCaseController>(
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
                      list.knownCases[index].title.tr,
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
