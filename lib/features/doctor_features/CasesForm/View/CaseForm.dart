import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/View/Widget/AppUpper.dart';
import 'package:flutter/material.dart';

class CaseForm extends StatelessWidget {
  const CaseForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppUpperWidget(),
        ],
      ),
    );
  }
}
