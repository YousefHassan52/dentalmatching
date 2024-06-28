import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/View/Widget/app_upper.dart';
import 'package:dentalmatching/features/doctor_features/view_whole_case_for_doctor/View/Widgets/add_progress.dart';
import 'package:dentalmatching/features/doctor_features/view_whole_case_for_doctor/View/Widgets/added_progress.dart';
import 'package:dentalmatching/features/doctor_features/view_whole_case_for_doctor/controller/progress_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProgressController progressController = Get.put(ProgressController());
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          AppUpperWidget(
              text: 'Progress        '.tr,
              needBackButton: true,
              welcome: false,
            ),
        
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AddProgress(
              caseId: progressController.caseId,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(
              alignment: AlignmentDirectional.topStart,
              fit: BoxFit.scaleDown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recently Added'.tr,
                    style: Styles.formTitle,
                  ),
                  IconButton(
                      onPressed: () {
                        progressController
                            .getProgress(progressController.caseId);
                      },
                      icon: const Icon(Icons.rocket_launch_outlined,color: AppColors.mainColor))
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const AddedProgress(),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
