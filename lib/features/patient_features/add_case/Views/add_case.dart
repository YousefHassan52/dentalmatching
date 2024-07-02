import 'package:dentalmatching/features/patient_features/add_case/controller/add_case_controller.dart';
import 'package:dentalmatching/features/patient_features/add_case/views/Widget/form_container.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/view/Widgets/upper.dart';
import 'package:dentalmatching/features/patient_features/view_casess/Controller/mycases_patient_controller_impl.dart';
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
        child: ListView(
          padding: const EdgeInsets.only(top: 0, bottom: 55),
          children: const [
            UpperWidget(),
            SizedBox(
              height: 12,
            ),
            FormContainer(),
          ],
        ),
      ),
    );
  }
}
