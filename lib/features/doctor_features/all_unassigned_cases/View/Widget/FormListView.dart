import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/View/Widget/CaseContainer.dart';
import 'package:dentalmatching/features/patient_features/View_Cases/Controller/mycases_patient_controller_impl.dart';
import 'package:dentalmatching/features/patient_features/View_Cases/View/Widget/FormContainerInfo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormListView extends StatelessWidget {
  const FormListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: CasContainer(),
          );
        },
      ),
    );
  }
}
