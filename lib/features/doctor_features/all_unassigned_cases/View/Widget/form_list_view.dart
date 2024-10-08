import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/View/Widget/case_container.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/controller/unassigned_cases_doctor_controller_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormListView extends StatelessWidget {
  const FormListView({super.key});

  @override
  Widget build(BuildContext context) {
    UnassignedCasesDoctorControllerImpl controller = Get.find();
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.8,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(top: 0, bottom: 60),
        itemCount: controller.cases.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CasContainer(caseModel: controller.cases[index]),
          );
        },
      ),
    );
  }
}
