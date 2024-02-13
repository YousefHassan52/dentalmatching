import 'package:auto_size_text/auto_size_text.dart';
import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/core/shared/shimmer.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/View/Widget/AppUpper.dart';
import 'package:dentalmatching/features/doctor_features/get_doctor_cases/View/Widget/FormListView.dart';
import 'package:dentalmatching/features/doctor_features/get_doctor_cases/controller/get_doctor_cases_controller_impl.dart';

import 'package:flutter/material.dart';
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
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              Container(
                child: const AutoSizeText(
                  maxFontSize: 17,
                  minFontSize: 15,
                  'Requested Cases',
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
            return Container(child: const FormListViewRequested());
          } else if (controller.requestStatus == RequestStatus.LOADING) {
            return const Expanded(child: ShimmerList());
          } else if (controller.requestStatus == RequestStatus.EMPTY_SUCCESS) {
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
        }),
      ],
    );
  }
}
