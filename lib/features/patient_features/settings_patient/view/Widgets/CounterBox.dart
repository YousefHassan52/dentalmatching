import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/features/patient_features/View_Cases/Controller/mycases_patient_controller_impl.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/view/Widgets/CasesCounterWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterBox extends StatelessWidget {
  const CounterBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    MyCasesPatientControllerImpl myCases = Get.find();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GetBuilder<MyCasesPatientControllerImpl>(builder: (controller) {
            return CasesCounterWidget(
                counter: "${myCases.myCases.length}", status: 'Cases');
          }),
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
