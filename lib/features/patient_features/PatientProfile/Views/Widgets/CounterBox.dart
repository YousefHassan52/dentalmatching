import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/features/patient_features/PatientProfile/Views/Widgets/ApprovalsCounterWidget.dart';
import 'package:dentalmatching/features/patient_features/PatientProfile/Views/Widgets/CasesCounterWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterBox extends StatelessWidget {
  const CounterBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.93,
      // height: 100,
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
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CasesCounterWidget(counter: '0', status: 'Cases'),
          SizedBox(
            width: 100,
            height: 50,
            child: VerticalDivider(
              color: Color.fromARGB(130, 67, 67, 67),
              thickness: 1,
            ),
          ),
          ApprovalsCounterWidget(
            approvalsCounter: '0',
            status: 'Approved',
          ),
        ],
      ),
    );
  }
}
