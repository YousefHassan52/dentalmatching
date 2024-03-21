import 'package:dentalmatching/features/admin_doctor_features/home/controller/home_controller_impl.dart';
import 'package:dentalmatching/features/admin_doctor_features/home/view/widgets/case_container_unkown_cases.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UnkownCasesFormListView extends StatelessWidget {
  const UnkownCasesFormListView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeDoctorAdminControllerImpl controller = Get.find();
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 0, bottom: 60),
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: controller.cases.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: UnkownCasContainer(caseModel: controller.cases[index]),
          );
        },
      ),
    );
  }
}
