import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/features/patient_features/Cases/Controller/FormController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KnownCheckWidget extends StatelessWidget {
  final ChronicDiseasesController controller = Get.put(ChronicDiseasesController());

  KnownCheckWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChronicDiseasesController>(
      builder: (controller) {
        return Column(
          children: [
            for (var state in controller.caseStatus)
              Column(
                children: [
                  RadioListTile(
                    activeColor: AppColors.mainColor,
                    title: Text(
                      state,
                      style: Styles.textStyle16Grey,
                    ),
                    value: state,
                    groupValue: controller.selected.value,
                    onChanged: (value) {
                      controller.handleSelection(value!);
                    },
                  ),
                ],
              ),
          ],
        );
      },
    );
  }
}
