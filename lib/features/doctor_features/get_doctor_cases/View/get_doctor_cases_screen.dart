import 'package:auto_size_text/auto_size_text.dart';
import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/core/shared/shimmer_column.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/View/Widget/app_upper.dart';
import 'package:dentalmatching/features/doctor_features/get_doctor_cases/View/Widget/form_list_view.dart';
import 'package:dentalmatching/features/doctor_features/get_doctor_cases/controller/get_doctor_cases_controller_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class GetDoctorCasesScreen extends StatelessWidget {
  const GetDoctorCasesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GetDocotorCasesControllerImpl externalController =
        Get.put(GetDocotorCasesControllerImpl());
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
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
        GetBuilder<GetDocotorCasesControllerImpl>(builder: (controller) {
          if (controller.requestStatus == RequestStatus.SUCCESS) {
            return const FormListViewRequested();
          } else if (controller.requestStatus == RequestStatus.LOADING) {
            return const ShimmerListColumn();
          } else if (controller.requestStatus == RequestStatus.EMPTY_SUCCESS) {
            return Center(
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.3,
                    child: SvgPicture.asset('assets/svg/GroupRRR.svg'),
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
                      height: Get.height * 0.3,
                      child: SvgPicture.asset('assets/svg/Empty-pana.svg'),
                    ),
                  ],
                ),
              ),
            );
          }
        }),
      ],
    );
  }
}
