import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/features/admin_doctor_features/view_whole_case/controller/view_case_controller_impl.dart';
import 'package:dentalmatching/features/common_faetures/loginn/view/widgets/auth_button.dart';
import 'package:dentalmatching/features/patient_features/add_case/Controller/add_case_controller.dart';
import 'package:dentalmatching/features/patient_features/add_case/data/staticData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DentalCasesList extends StatelessWidget {
  const DentalCasesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StaticData list = StaticData();

    return GetBuilder<ViewWholeCaseForAdminControllerImp>(
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: AuthButton(
                buttonText: "Confirm",
                onTap: () {
                  controller.classify();
                  Navigator.pop(context);
                },
              ),
            )
          ],
        );
      },
    );
  }
}
