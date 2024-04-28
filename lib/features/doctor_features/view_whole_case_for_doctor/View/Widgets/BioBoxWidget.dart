import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/features/doctor_features/view_whole_case_for_doctor/View/Widgets/BioWidget.dart';
import 'package:dentalmatching/features/doctor_features/view_whole_case_for_doctor/controller/view_whole_case_doctor_controller_impl.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/view/Widgets/CircleAvatarWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BioBoxWidget extends StatelessWidget {
  const BioBoxWidget({
    super.key,
    required this.controller,
  });

  final ViewWholeCaseDoctorControllerImpl controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.circleColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.blueLightTextColor.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: SizedBox(
                    height: 60,
                    child:
                        CircleAvatarWidget(imagePath: 'assets/svg/profile.svg'),
                  ),
                ),
              ),
              Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    controller.caseModel.patientName,
                    style: Styles.textStyle15LightBlue,
                  ),
                ),
              ),
            ],
          ),
          BioWidget(
            title: 'Address',
            subTitle: controller.caseModel.patientCity,
          ),
          BioWidget(
            title: 'Age',
            subTitle: "${controller.caseModel.patientAge}",
          ),
          BioWidget(
            title: 'Case Status',
            subTitle: controller.caseModel.isKnown == true ? "Known" : "Unkown",
          ),
          GetBuilder<ViewWholeCaseDoctorControllerImpl>(
            builder: (internalController) {
              if (controller.caseModel.isAssigned == true) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    BioWidget(
                      title: 'Phone number',
                      subTitle: internalController.caseModel.phoneNumber,
                    ),
                  ],
                );
              }
              if (controller.requestStatus == RequestStatus.LOADING) {
                return const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    backgroundColor: AppColors.mainColor,
                    color: AppColors.secondColor,
                  ),
                );
              } else if (internalController.viewPhone == true &&
                  controller.requestStatus == RequestStatus.SUCCESS) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    BioWidget(
                      title: 'Phone number',
                      subTitle: internalController.caseModel.phoneNumber,
                    ),
                  ],
                );
              } else {
                return BioWidget(
                  isLongText: true,
                  title: 'Phone Number',
                  subTitle: "None",
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
