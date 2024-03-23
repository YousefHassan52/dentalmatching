import 'package:dentalmatching/features/patient_features/edit_case/controller/editCaseController.dart';
import 'package:dentalmatching/features/patient_features/edit_case/view/widgets/form_container.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/view/Widgets/Upper.dart';
import 'package:dentalmatching/features/patient_features/View_Cases/Controller/mycases_patient_controller_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditCaseScreen extends StatelessWidget {
  const EditCaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(EditCaseController());
    Get.put(MyCasesPatientControllerImpl());
    return Scaffold(
      body: SizedBox(
        child: ListView(
          padding: const EdgeInsets.only(top: 0, bottom: 55),
          children:  [
            UpperWidget(
              needBackButton: true,
              text: 'Edit Case        '.tr,
              welcome: false,
            ),
            const SizedBox(
              height: 12,
            ),
            const EditCaseFormContainer(),
          ],
        ),
      ),
    );
  }
}
