import 'package:auto_size_text/auto_size_text.dart';
import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/core/shared/shimmer.dart';
import 'package:dentalmatching/features/doctor_features/HomaPageDr/View/HomePageDr.dart';
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
          const AppUpperWidget(
            needBackButton: true,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Flexible(
                  flex: 200,
                  fit: FlexFit.loose,
                  child: FittedBox(
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
                    externalController.getCases();
                  },
                  icon: const Icon(
                    Icons.rocket_launch_outlined,
                    color: AppColors.mainColor,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.to(const HomePageDr());
                  },
                  icon: const Icon(
                    Icons.abc_sharp,
                    color: AppColors.mainColor,
                  ),
                ),
              ],
            ),
          ),
          //CategoriesListView(),
          //CategoriesListView(),
          // const SizedBox(
          //   height: 0,
          // ),
          // MaterialButton(
          //   onPressed: () {},
          //   child: const Row(
          //     children: [
          //       Text('Search'),
          //       SizedBox(
          //         width: 5,
          //       ),
          //       Icon(Icons.search_outlined)
          //     ],
          //   ),
          // ),
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
