import 'package:auto_size_text/auto_size_text.dart';
import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/core/shared/shimmer_column.dart';
import 'package:dentalmatching/features/admin_doctor_features/home/controller/home_controller_impl.dart';
import 'package:dentalmatching/features/admin_doctor_features/home/view/widgets/form_list_view_unkown_cases.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/View/Widget/AppUpper.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AdminDoctorHome extends StatelessWidget {
  const AdminDoctorHome({super.key});

  @override
  Widget build(BuildContext context) {
    HomeDoctorAdminControllerImpl externalController =
        Get.put(HomeDoctorAdminControllerImpl());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "DentaMatch",
          style: Styles.mediumTitle.copyWith(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                externalController.logout();
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                    externalController.getData();
                  },
                  icon: const Icon(
                    Icons.rocket_launch_outlined,
                    color: AppColors.mainColor,
                  ),
                ),
              ],
            ),
          ),
          GetBuilder<HomeDoctorAdminControllerImpl>(builder: (controller) {
            if (controller.requestStatus == RequestStatus.SUCCESS) {
              return const UnkownCasesFormListView();
            } else if (controller.requestStatus == RequestStatus.LOADING) {
              return const Expanded(child: ShimmerListColumn());
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
