import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/View/Widget/CaseContainer.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/controller/unassigned_cases_doctor_controller_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormView extends StatelessWidget {
  const FormView({super.key});

  @override
  Widget build(BuildContext context) {
    UnassignedCasesDoctorControllerImpl controller = Get.find();
    return SizedBox(
      height: Get.height*5,
      width: Get.width*0.9,
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 0,bottom: 60),
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        //scrollDirection: Axis.horizontal,
        itemCount: 3,
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
