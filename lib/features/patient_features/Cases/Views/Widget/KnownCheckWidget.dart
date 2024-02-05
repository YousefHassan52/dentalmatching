import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/features/patient_features/Cases/Controller/FormController.dart';
import 'package:dentalmatching/features/patient_features/Cases/Controller/KnownController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KnownCheckWidget extends StatelessWidget {
  final KnownController controller = Get.put(KnownController());

  KnownCheckWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<KnownController>(
      builder: (controller) {
        return Column(
          children: [
            for (var choise in controller.choise)
              Column(
                children: [
                  RadioListTile(
                    activeColor: AppColors.mainColor,
                    title: Text(
                      choise,
                      style: Styles.textStyle16Grey,
                    ),
                    value: choise,
                    groupValue: controller.selectCase.value,
                    onChanged: (value) {
                      controller.handleSelectionChange(value!);
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
