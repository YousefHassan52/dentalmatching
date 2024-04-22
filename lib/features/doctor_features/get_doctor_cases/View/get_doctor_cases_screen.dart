import 'package:auto_size_text/auto_size_text.dart';
import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/core/shared/shimmer_column.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/View/Widget/AppUpper.dart';
import 'package:dentalmatching/features/doctor_features/get_doctor_cases/View/Widget/FormListView.dart';
import 'package:dentalmatching/features/doctor_features/get_doctor_cases/controller/get_doctor_cases_controller_impl.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class GetDoctorCasesScreen extends StatelessWidget {
  const GetDoctorCasesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GetDocotorCasesControllerImpl externalController =
        Get.put(GetDocotorCasesControllerImpl());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppUpperWidget(),
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
                    'Requested Cases'.tr,
                    style: Styles.lightBlue,
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
                  ))
            ],
          ),
        ),
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
        GetBuilder<GetDocotorCasesControllerImpl>(builder: (controller) {
          if (controller.requestStatus == RequestStatus.SUCCESS) {
            return const FormListViewRequested();
          } else if (controller.requestStatus == RequestStatus.LOADING) {
            return const Expanded(child: ShimmerListColumn());
          } else if (controller.requestStatus == RequestStatus.EMPTY_SUCCESS) {
            return SvgPicture.asset('assets/svg/NoCases.svg');
          } else {
            return Center(
              child: SvgPicture.asset('assets/svg/NoCases.svg'),
            );
          }
        }),
      ],
    );
  }
}
