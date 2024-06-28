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
          Center(
            child: Text(
              "Progress".tr,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          AddProgress(
            caseId: progressController.caseId,
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
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                  IconButton(
                      onPressed: () {
                        progressController
                            .getProgress(progressController.caseId);
                      },
                      icon: const Icon(Icons.rocket_launch_outlined))
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
