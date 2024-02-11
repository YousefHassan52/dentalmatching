import 'package:dentalmatching/features/patient_features/AddCase/Controller/FormController.dart';
import 'package:dentalmatching/features/patient_features/AddCase/Views/Widget/FormContainer.dart';
import 'package:dentalmatching/features/patient_features/PatientProfile/Views/Widgets/Upper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCaseScreen extends StatelessWidget {
  const AddCaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ChronicDiseasesController());
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        child: ListView(
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
