import 'package:dentalmatching/features/doctor_features/home_screen_dr/View/widgets/appointment_card_widget.dart';
import 'package:dentalmatching/features/doctor_features/get_doctor_cases/controller/get_doctor_cases_controller_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentListView extends StatelessWidget {
  const AppointmentListView({super.key});

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
            child: AppointmentCardWidget(caseModel: controller.cases[index]),
          );
        },
      ),
    );
  }
}
