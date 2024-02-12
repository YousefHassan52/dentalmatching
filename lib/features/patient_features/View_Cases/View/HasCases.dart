// ignore_for_file: file_names

import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/features/patient_features/PatientProfile/Views/Widgets/Upper.dart';
import 'package:dentalmatching/features/patient_features/View_Cases/Controller/mycases_patient_controller_impl.dart';
import 'package:dentalmatching/features/patient_features/View_Cases/View/Widget/FormContainerInfo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HasCases extends StatelessWidget {
  const HasCases({super.key});

  @override
  Widget build(BuildContext context) {
    MyCasesPatientControllerImpl externalController =
        Get.put(MyCasesPatientControllerImpl());
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const UpperWidget(),
          const SizedBox(
            height: 9,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                const Text(
                  'My Cases',
                  style: Styles.textStyle16LightBlue,
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      externalController.getCases();
                    },
                    icon: const Icon(
                      Icons.replay,
                      color: AppColors.mainColor,
                    ))
              ],
            ),
          ),
          GetBuilder<MyCasesPatientControllerImpl>(builder: (controller) {
            if (controller.requestStatus == RequestStatus.LOADING) {
              return const Center(child: CircularProgressIndicator());
            } else if (controller.requestStatus == RequestStatus.SUCCESS) {
              return Expanded(
                child: ListView.builder(
                  // shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: externalController.myCases.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FormContainerInfo(
                        caseModel: controller.myCases[index],
                      ),
                    );
                  },
                ),
              );
            } else if (controller.requestStatus ==
                RequestStatus.EMPTY_SUCCESS) {
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
          })
        ],
      ),
    );
  }
}
