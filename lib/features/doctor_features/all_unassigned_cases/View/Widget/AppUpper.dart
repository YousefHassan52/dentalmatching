import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/View/Widget/DrProfileWidget.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/controller/unassigned_cases_doctor_controller_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppUpperWidget extends StatelessWidget {
  const AppUpperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    UnassignedCasesDoctorControllerImpl controller = Get.put(
        UnassignedCasesDoctorControllerImpl()); // momkn 2a7ot controller 8ero
    double upperPartHeight = Get.height * 0.2;
    return Container(
      height: upperPartHeight,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/images/signup.png"),
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          color: AppColors.mainColor.withOpacity(0.8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            DrProfileWidget(
                title: 'Welcome',
                name: 'Dr.${controller.doctorModel.fullName}'),
            SizedBox(
              height: upperPartHeight * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}
