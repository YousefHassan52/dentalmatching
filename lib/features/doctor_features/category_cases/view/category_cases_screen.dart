import 'package:auto_size_text/auto_size_text.dart';
import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/core/shared/shimmer_column.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/View/Widget/app_upper.dart';
import 'package:dentalmatching/features/doctor_features/category_cases/controller/category_cases_controller_impl.dart';
import 'package:dentalmatching/features/doctor_features/category_cases/view/widgets/category_form_list_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CategoryCasesScreen extends StatelessWidget {
  const CategoryCasesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryCasesControllerImpl externalController =
        Get.put(CategoryCasesControllerImpl());
    return Scaffold(
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          AppUpperWidget(
            welcome: false,
            needBackButton: true,
            text: externalController.category,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  maxFontSize: 25,
                  minFontSize: 15,
                  "Recently Added Cases".tr,
                  style: Styles.lightBlue,
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
          GetBuilder<CategoryCasesControllerImpl>(builder: (controller) {
            if (controller.requestStatus == RequestStatus.SUCCESS) {
              return const CategoryFormListView();
            } else if (controller.requestStatus == RequestStatus.LOADING) {
              return const ShimmerListColumn();
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
