import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/features/patient_features/Cases/Views/Widget/FormContainer.dart';
import 'package:dentalmatching/features/patient_features/PatientProfile/Views/Widgets/Upper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AddCaseScreen extends StatelessWidget {
  const AddCaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: ListView(
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
