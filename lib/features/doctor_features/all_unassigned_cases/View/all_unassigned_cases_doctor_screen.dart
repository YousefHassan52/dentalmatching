import 'package:auto_size_text/auto_size_text.dart';
import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/core/shared/shimmer.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/View/Widget/AppUpper.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/View/Widget/FormListView.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/controller/unassigned_cases_doctor_controller_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AllUnassignedCasesDoctorScreen extends StatelessWidget {
  const AllUnassignedCasesDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UnassignedCasesDoctorControllerImpl externalController =
        Get.put(UnassignedCasesDoctorControllerImpl());
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           AppUpperWidget(
            welcome: false,
            needBackButton: true,
            text: 'All Cases       '.tr,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                      style: Styles.LightBlue,
                    ),
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
                  ),
                ),
              ],
            ),
          ),
          GetBuilder<UnassignedCasesDoctorControllerImpl>(
              builder: (controller) {
            if (controller.requestStatus == RequestStatus.SUCCESS) {
              return const FormListView();
            } else if (controller.requestStatus == RequestStatus.LOADING) {
              return const Expanded(child: ShimmerList());
            } else if (controller.requestStatus ==
                RequestStatus.EMPTY_SUCCESS) {
              return Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 350,
                      width: 270,
                      child: SvgPicture.asset('assets/svg/Empty-pana.svg'),
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 350,
                        width: 270,
                        child: SvgPicture.asset('assets/svg/GroupRRR.svg'),
                      ),
                    ],
                  ),
                ),
              );
            }
          }),
        ],
      ),
    );
  }
}
