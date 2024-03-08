// ignore_for_file: file_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/core/shared/shimmer.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/view/Widgets/Upper.dart';
import 'package:dentalmatching/features/patient_features/View_Cases/Controller/mycases_patient_controller_impl.dart';
import 'package:dentalmatching/features/patient_features/View_Cases/View/Widget/FormContainerInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

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
                Container(
                  child: const AutoSizeText(
                    maxFontSize: 17,
                    minFontSize: 15,
                    'Your Cases',
                    style: Styles.LightBlue,
                  ),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      externalController.getCases();
                    },
                    icon: const Icon(
                      Icons.rocket_launch_outlined,
                      color: AppColors.mainColor,
                    ))
              ],
            ),
          ),
          GetBuilder<MyCasesPatientControllerImpl>(builder: (controller) {
            if (controller.requestStatus == RequestStatus.LOADING) {
              return const Expanded(child: ShimmerList());
            } else if (controller.requestStatus == RequestStatus.SUCCESS) {
              return Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 0, bottom: 70),
                  shrinkWrap: true,
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
              return  Center(
                child: SizedBox(
              height: 400,
              child: SvgPicture.asset('assets/svg/NoCases.svg'),
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
