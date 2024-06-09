// ignore_for_file: file_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/core/shared/shimmer_column.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/view/Widgets/upper.dart';
import 'package:dentalmatching/features/patient_features/view_casess/Controller/mycases_patient_controller_impl.dart';
import 'package:dentalmatching/features/patient_features/view_casess/View/Widget/form_containerInfo.dart';
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
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(top: 0),
        children: [
          const UpperWidget(),
          const SizedBox(
            height: 9,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 200,
                  fit: FlexFit.loose,
                  child: FittedBox(
                    child: AutoSizeText(
                      maxFontSize: 25,
                      minFontSize: 15,
                      'Recently Added Cases'.tr,
                      style: Styles.lightBlue,
                    ),
                  ),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      // print(externalController.patientModel.fullName);
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
              return const ShimmerListColumn();
            } else if (controller.requestStatus == RequestStatus.SUCCESS) {
              return ListView.builder(
                padding: const EdgeInsets.only(top: 0, bottom: 70),
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true, // Added to let the ListView.builder take only the space it needs
                itemCount: externalController.myCases.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FormContainerInfo(
                      caseModel: controller.myCases[index],
                    ),
                  );
                },
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
          }),
        ],
      ),
    );
  }
}
