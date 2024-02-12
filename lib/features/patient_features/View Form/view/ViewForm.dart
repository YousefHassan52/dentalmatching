import 'package:dentalmatching/features/patient_features/AddCase/Views/Widget/HDivider.dart';
import 'package:flutter/material.dart';
import 'package:dentalmatching/features/patient_features/PatientProfile/Views/Widgets/Upper.dart';
import 'package:dentalmatching/features/patient_features/View Form/view/Widget/GridViewWidget.dart';

class ViewForm extends StatelessWidget {
  const ViewForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          UpperWidget(),
           HDivider(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal:8.0),
              child: GridViewWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
