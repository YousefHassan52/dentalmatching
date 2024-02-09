import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/core/functions/validator.dart';
import 'package:dentalmatching/features/patient_features/Cases/Controller/FormController.dart';
import 'package:dentalmatching/features/patient_features/Cases/Model/CheckListModel.dart';
import 'package:dentalmatching/features/patient_features/Cases/Views/Widget/RadioList.dart';
import 'package:dentalmatching/features/patient_features/Cases/data/staticData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CasesChecklist extends StatelessWidget {
  final ChronicDiseasesController controller =
      Get.put(ChronicDiseasesController());
  StaticData list = StaticData();

  CasesChecklist({super.key});
  @override
  Widget build(BuildContext context) {
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
