import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/features/patient_features/view_full_case_patient/controller/view_full_case_patient_controller_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProgressScreenPatient extends StatelessWidget {
  const ProgressScreenPatient({super.key});

  @override
  Widget build(BuildContext context) {
    ViewFullCasePatientControllerImpl controller =
        Get.put(ViewFullCasePatientControllerImpl());
    return FractionallySizedBox(
      heightFactor: 0.9,
      child: Form(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const SizedBox(
              height: 10,
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
                        onPressed: () {},
                        icon: const Icon(Icons.rocket_launch_outlined))
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            GetBuilder<ViewFullCasePatientControllerImpl>(
              builder: (controller) {
                return LayoutBuilder(
                  builder: (context, constraints) {
                    return SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: List.generate(
                            controller.progressEntries.length,
                            (index) {
                              return Card(
                                color: AppColors.blueLightTextColor,
                                shadowColor:
                                    const Color.fromARGB(255, 68, 67, 67),
                                elevation: 5.0,
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: Text(
                                        "Session ${index + 1}".tr,
                                        style:
                                            const TextStyle(color: Colors.white),
                                      ),
                                      subtitle: Text(
                                        controller.progressEntries[index]
                                            ['date']!,
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                117, 191, 191, 191)),
                                      ),
                                      trailing: IconButton(
                                        onPressed: () =>
                                            controller.toggleAdded(index),
                                        icon: Icon(
                                          controller.expandedStates[index]
                                              ? Icons.expand_less
                                              : Icons.expand_more,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    if (controller.expandedStates[index])
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          padding: const EdgeInsets.all(5),
                                          constraints: BoxConstraints(
                                            maxWidth: constraints.maxWidth *
                                                0.9, // Adjust as needed
                                          ),
                                          decoration: const BoxDecoration(
                                              color:
                                                  Color.fromARGB(255, 8, 38, 102),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              controller.progressEntries[index]
                                                  ['text']!,
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
