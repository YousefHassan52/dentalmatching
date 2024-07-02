import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/shared/models/shimmer_row.dart';
import 'package:dentalmatching/features/doctor_features/home_screen_dr/View/widgets/case_container_home_page.dart';
import 'package:dentalmatching/features/doctor_features/home_screen_dr/controller/get_three_cases_controller_imp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ThreeCasesList extends StatelessWidget {
  const ThreeCasesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetThreeCasesControllerImpl>(builder: (controller) {
      if (controller.requestStatus == RequestStatus.SUCCESS) {
        return SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.3,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.cases.length,
            itemBuilder: (context, index) => FittedBox(
              fit: BoxFit.scaleDown,
              child: DoctorHomeCaseContainer(
                caseModel: controller.cases[index],
              ),
            ),
          ),
        );
      } else if (controller.requestStatus == RequestStatus.LOADING) {
        return const ShimmerListRow();
      } else if (controller.requestStatus == RequestStatus.EMPTY_SUCCESS) {
        return Center(
          child: Column(
            children: [
              SizedBox(
                height: 150,
                width: 150,
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
                  height: 150,
                  width: 150,
                  child: SvgPicture.asset('assets/svg/GroupRRR.svg'),
                ),
              ],
            ),
          ),
        );
      }
    });
  }
}
