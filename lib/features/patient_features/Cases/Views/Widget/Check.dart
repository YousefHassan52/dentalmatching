import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/features/patient_features/Cases/Controller/FormController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChronicDiseasesChecklist extends StatelessWidget {
  final ChronicDiseasesController controller =
      Get.put(ChronicDiseasesController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChronicDiseasesController>(
      builder: (controller) {
        return Column(
          children: [
            for (int index = 0;
                index < controller.chronicDiseases.length;
                index++)
              Column(
                children: [
                  CheckboxListTile(
                    checkColor: AppColors.blueLightTextColor,
                    activeColor: Colors.transparent,
                    checkboxShape: OvalBorder(),
                    title: Text(
                      controller.chronicDiseases[index].title,
                      style: Styles.textStyle16Grey,
                    ),
                    value: controller.checkedItems[index],
                    onChanged: (value) {
                      controller.handleCheckboxChange(index, value!);
                    },
                    controlAffinity: ListTileControlAffinity
                        .leading, // Move the checkbox to the leading position
                    contentPadding: EdgeInsets.all(0), // Remove default padding
                    dense: true,
                  ),
                  if (controller.showPressureChecklist.value &&
                      controller.chronicDiseases[index].title == 'Hypertension')
                    Column(
                      children: [
                        for (var level in controller.pressureLevels)
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: RadioListTile(
                              activeColor: AppColors.mainColor,
                              title: Text(
                                level,
                                style: Styles.textStyle16Grey,
                              ),
                              value: level,
                              groupValue:
                                  controller.selectedPressureLevel.value,
                              onChanged: (value) {
                                controller.handlePressureLevelChange(value!);
                              },
                            ),
                          ),
                      ],
                    ),
                ],
              ),
          ],
        );
      },
    );
  }
}
