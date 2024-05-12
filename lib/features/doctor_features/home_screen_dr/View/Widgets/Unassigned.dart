import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/shared/shimmer_column.dart';
import 'package:dentalmatching/features/doctor_features/home_screen_dr/View/Widgets/FormView.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/View/Widget/FormListView.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/controller/unassigned_cases_doctor_controller_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class UnAssignedThree extends StatelessWidget {
  const UnAssignedThree({super.key});

  @override
  Widget build(BuildContext context) {
    UnassignedCasesDoctorControllerImpl externalController =
        Get.put(UnassignedCasesDoctorControllerImpl());
    return GetBuilder<UnassignedCasesDoctorControllerImpl>(
        builder: (controller) {
      if (controller.requestStatus == RequestStatus.SUCCESS) {
        return const FormView();
      } else if (controller.requestStatus == RequestStatus.LOADING) {
        return const Expanded(child: ShimmerListColumn());
      } else if (controller.requestStatus == RequestStatus.EMPTY_SUCCESS) {
        return Center(
          child: Column(
            children: [
              SizedBox(
                height: 350,
                width: 270,
                child: SvgPicture.asset('assets/svg/Empty-pana.svg'),
              ),
            ],
          ),
        );
      } else {
        return Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
                SizedBox(
                  height: 350,
                  width: 270,
                  child: SvgPicture.asset('assets/svg/GroupRRR.svg'),
                ),
              ],
            ),
          ),
        );
      }
    });
  }
}
