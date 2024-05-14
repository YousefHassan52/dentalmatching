import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/features/admin_doctor_features/view_whole_case/controller/view_case_controller_impl.dart';
import 'package:dentalmatching/features/doctor_features/view_whole_case_for_doctor/View/Widgets/bio_widget.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/view/Widgets/circle_avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BioBarWidgetAdmin extends StatelessWidget {
  const BioBarWidgetAdmin({
    super.key,
  });
// test commit
  @override
  Widget build(BuildContext context) {
    ViewWholeCaseForAdminControllerImp controller =
        Get.put(ViewWholeCaseForAdminControllerImp());
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
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
                    style: const TextStyle(
                        color: AppColors.mainColor,
                        fontWeight: FontWeight.w800,
                        fontSize: 20),
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
              BioWidget(
                title: 'Address',
                subTitle: controller.caseModel.patientCity,
                textColor: AppColors.mainColor,
              ),
              BioWidget(
                title: 'Age',
                subTitle: "${controller.caseModel.patientAge}",
                textColor: AppColors.mainColor,
              ),
              BioWidget(
                title: 'Case Status',
                subTitle:
                    controller.caseModel.isKnown == true ? "Known" : "Unkown",
                textColor: AppColors.mainColor,
              ),

              // GetBuilder<AppointmentController>(
              //   builder: (controller) => Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       const Icon(Icons.access_time),
              //       const SizedBox(width: 10),
              //       Text(
              //         'Time: ${controller.selectedTime.hour}:${controller.selectedTime.minute}',
              //         style: const TextStyle(fontSize: 20),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
