import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/shared/shimmer.dart';
import 'package:dentalmatching/features/doctor_features/HomaPageDr/View/Widgets/AppointmentListView.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/View/Widget/AppUpper.dart';
import 'package:dentalmatching/features/doctor_features/get_doctor_cases/View/Widget/FormListView.dart';
import 'package:dentalmatching/features/doctor_features/get_doctor_cases/controller/get_doctor_cases_controller_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentFullScreen extends StatelessWidget {
  const AppointmentFullScreen({super.key});

  @override
  Widget build(BuildContext context) {
       GetDocotorCasesControllerImpl externalController =
        Get.put(GetDocotorCasesControllerImpl());
    return  Scaffold(
      body: Column(
        children: [
          AppUpperWidget(
              text: 'Appointments        '.tr,
              needBackButton: true,
              welcome: false,
            ),
          GetBuilder<GetDocotorCasesControllerImpl>(builder: (controller) {
          if (controller.requestStatus == RequestStatus.SUCCESS) {
            return Container(child: const AppointmentListView());
          } else if (controller.requestStatus == RequestStatus.LOADING) {
            return const Expanded(child: ShimmerList());
          } else if (controller.requestStatus == RequestStatus.EMPTY_SUCCESS) {
            return const Center(
              child: Text(
                "No Cases Yet",
                style: TextStyle(color: Colors.black),
              ),
            );
          } else {
            return const Center(
              child: Text("Reload Data"),
            );
          }
        }),

          ],
      ),
    );
  }
}