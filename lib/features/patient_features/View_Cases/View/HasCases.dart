// ignore_for_file: file_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/core/shared/shimmer.dart';
import 'package:dentalmatching/features/doctor_features/view_whole_case_for_doctor/View/Widgets/UpperNot.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/view/Widgets/Upper.dart';
import 'package:dentalmatching/features/patient_features/View_Cases/Controller/mycases_patient_controller_impl.dart';
import 'package:dentalmatching/features/patient_features/View_Cases/View/Widget/FormContainerInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
            padding: const EdgeInsets.only(left: 8.0, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: AutoSizeText(
                      maxFontSize: 25,
                      minFontSize: 15,
                      'Recently Added Cases',
                      style: Styles.LightBlue,
                    ),
                  ),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      print(externalController.patientModel.fullName);
                      // externalController.getCases();
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
              return Center(
                child: SvgPicture.asset('assets/svg/NoCasesss.svg'),
              );
            } else {
              return Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 350,
                      width: 270,
                      child: SvgPicture.asset('assets/svg/GroupRRR.svg'),
                    ),
                  ],
                ),
              );
            }
          })
        ],
      ),
    );
  }
}
