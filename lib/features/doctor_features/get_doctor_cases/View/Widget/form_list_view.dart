import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/View/Widget/case_container.dart';
import 'package:dentalmatching/features/doctor_features/get_doctor_cases/controller/get_doctor_cases_controller_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormListViewRequested extends StatelessWidget {
  const FormListViewRequested({super.key});

  @override
  Widget build(BuildContext context) {
    GetDocotorCasesControllerImpl controller = Get.find();
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 0, bottom: 60),
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
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
