import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/features/doctor_features/get_doctor_cases/controller/get_doctor_cases_controller_impl.dart';

import 'package:dentalmatching/features/patient_features/settings_patient/view/Widgets/CasesCounterWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterBoxDoctor extends StatelessWidget {
  const CounterBoxDoctor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //GetDocotorCasesControllerImpl myCases = Get.find();
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.circleColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.blueLightTextColor.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GetBuilder<GetDocotorCasesControllerImpl>(
            builder: (controller) => CasesCounterWidget(
                counter: controller.cases.length.toString(), status: 'Case'.tr),
          ),
          // SizedBox(
          //   width: 100,
          //   height: 50,
          //   child: VerticalDivider(
          //     color: Color.fromARGB(130, 67, 67, 67),
          //     thickness: 1,
          //   ),
          // ),
          // ApprovalsCounterWidget(
          //   approvalsCounter: '0',
          //   status: 'Approved',
          // ),
        ],
      ),
    );
  }
}
