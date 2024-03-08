import 'package:dentalmatching/features/patient_features/AddCase/Controller/FormController.dart';
import 'package:dentalmatching/features/patient_features/AddCase/Views/Widget/FormContainer.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/view/Widgets/Upper.dart';
import 'package:dentalmatching/features/patient_features/View_Cases/Controller/mycases_patient_controller_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCaseScreen extends StatelessWidget {
  const AddCaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddCaseController());
    Get.put(MyCasesPatientControllerImpl());
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        child: ListView(
          padding: EdgeInsets.only(top: 0, bottom: 55),
          children: [
            const UpperWidget(),
            const SizedBox(
              height: 12,
            ),
            FormContainer(),
          ],
        ),
      ),
    );
  }
}
