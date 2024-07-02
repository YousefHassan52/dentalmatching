import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/features/doctor_features/view_whole_case_for_doctor/View/widgets/bio_widget.dart';
import 'package:dentalmatching/features/doctor_features/view_whole_case_for_doctor/View/widgets/call_number.dart';
import 'package:dentalmatching/features/doctor_features/view_whole_case_for_doctor/controller/view_whole_case_doctor_controller_impl.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/view/Widgets/circle_avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'date_time_widget.dart';

class BioBarWidget extends StatelessWidget {
  const BioBarWidget({
    super.key,
    required this.controller,
  });

  final ViewWholeCaseDoctorControllerImpl controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: SizedBox(
                    height: 60,
                    child: controller.caseModel.patientProfileImageLink == null
                        ? const CircleAvatarWidget(
                            imagePath: 'assets/svg/profile.svg')
                        : CircleAvatarWidget(
                            imagePath:
                                controller.caseModel.patientProfileImageLink!,
                            defaultImage: false,
                          ),
                  ),
                ),
              ),
              Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    controller.caseModel.patientName,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 20),
          child: Column(
            children: [
              if (controller.caseModel.isAssigned == true)
                DateTimeWidget(
                  controller: controller,
                  txt: formatDate(controller.caseModel.appointmentDateTime!),
                  text: 'Date : '.tr,
                ),
              if (controller.caseModel.isAssigned == true)
                DateTimeWidget(
                  controller: controller,
                  txt: formatTime(controller.caseModel.appointmentDateTime!),
                  text: 'Time : '.tr,
                ),

              BioWidget(
                title: 'Address'.tr,
                subTitle: controller.caseModel.patientCity,
              ),
              BioWidget(
                title: 'Age'.tr,
                subTitle: "${controller.caseModel.patientAge}",
              ),
              BioWidget(
                title: 'Case Status'.tr,
                subTitle: controller.caseModel.isKnown == true
                    ? "Known".tr
                    : "Unkown".tr,
              ),

              GetBuilder<ViewWholeCaseDoctorControllerImpl>(
                builder: (internalController) {
                  if (controller.caseModel.isAssigned == true) {
                    return Column(
                      children: [
                     
                        CallNumberWidget(
                            number: controller.caseModel.phoneNumber)
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
                          title: 'Phone Number'.tr,
                          subTitle: internalController.caseModel.phoneNumber,
                        ),
                      ],
                    );
                  } else {
                    return BioWidget(
                      isLongText: true,
                      title: 'Phone Number'.tr,
                      subTitle: "After Request".tr,
                    );
                  }
                },
              ),

            ],
          ),
        ),
      ],
    );
  }
}
