import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/features/patient_features/Cases/Views/Cases.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApprovalsCounterWidget extends GetView<MyServices> {
  final String approvalsCounter;
  final String status;
  const ApprovalsCounterWidget({
    super.key,
    required this.approvalsCounter,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(CasesScreen());
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              approvalsCounter,
              style: const TextStyle(
                fontSize: 20,
                color: AppColors.blueTextColor,
              ),
            ),
          // ),
          Text(
            status,
            style: const TextStyle(color: Color.fromARGB(255, 93, 92, 92)),
          ),
        ],
      ),
    );
  }

  
}
