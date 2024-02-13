import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/controller/unassigned_cases_doctor_controller_impl.dart';
import 'package:dentalmatching/features/doctor_features/view_whole_case_for_doctor/View/Widgets/BioWidget.dart';
import 'package:dentalmatching/features/doctor_features/view_whole_case_for_doctor/View/Widgets/BoxWidget.dart';
import 'package:dentalmatching/features/doctor_features/view_whole_case_for_doctor/View/Widgets/RequestButton.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/View/Widget/AppUpper.dart';
import 'package:dentalmatching/features/doctor_features/view_whole_case_for_doctor/controller/view_whole_case_doctor_controller_impl.dart';
import 'package:dentalmatching/features/patient_features/AddCase/Views/Widget/FormHeadLine.dart';
import 'package:dentalmatching/features/patient_features/AddCase/Views/Widget/HDivider.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/view/Widgets/CircleAvatarWidget.dart';
import 'package:dentalmatching/features/patient_features/view_full_case_patient/view/Widget/ChronicList.dart';
import 'package:dentalmatching/features/patient_features/view_full_case_patient/view/Widget/GridViewWidget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewWholeCaseForDoctor extends StatelessWidget {
  const ViewWholeCaseForDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    ViewWholeCaseDoctorControllerImpl controller =
        Get.put(ViewWholeCaseDoctorControllerImpl());
    UnassignedCasesDoctorControllerImpl reloadDataController =
        Get.put(UnassignedCasesDoctorControllerImpl());

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(top: 0, bottom: 5),
        children: [
          const AppUpperWidget(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                        height: 60,
                        child: const CircleAvatarWidget(
                            imagePath: 'assets/svg/profile.svg'),
                      ),
                      Text(
                        controller.caseModel.patientName,
                        style: Styles.textStyle15LightBlue,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: FittedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                          subTitle: controller.caseModel.isKnown == true
                              ? "Known"
                              : "Unkown",
                        ),
                        GetBuilder<ViewWholeCaseDoctorControllerImpl>(
                          builder: (internalController) {
                            // if loading return circular progress
                            if (controller.requestStatus ==
                                RequestStatus.LOADING) {
                              return const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  backgroundColor: AppColors.mainColor,
                                  color: AppColors.secondColor,
                                ),
                              );
                            } else if (internalController.viewPhone == true &&
                                controller.requestStatus ==
                                    RequestStatus.SUCCESS) {
                              return Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  BioWidget(
                                    title: 'Phone number',
                                    subTitle: internalController
                                        .caseModel.phoneNumber,
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
                  ),
                ),
                RequestButton(
                  onPressed: () {
                    controller
                        .requestCase(caseId: controller.caseModel.caseId)
                        .then((value) {
                      reloadDataController.getCases();
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const HDivider(),
                const SizedBox(
                  height: 20,
                ),
                const FormHeadLine(headline: 'Description'),
                const SizedBox(
                  height: 20,
                ),
                BoxWidget(
                  widget: Text(
                    controller.caseModel.description,
                    style: Styles.textStyle16Grey,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const HDivider(),
                const SizedBox(
                  height: 20,
                ),
                const FormHeadLine(headline: 'Chronic Diseases'),
                const SizedBox(
                  height: 20,
                ),
                BoxWidget(
                  widget: controller.caseModel.chronicDiseases.isNotEmpty
                      ? ChronicOrDentalList(
                          list: controller.caseModel.chronicDiseases)
                      : const Text(
                          "None",
                          style: Styles.textStyle16Grey,
                        ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const HDivider(),
                const SizedBox(
                  height: 20,
                ),
                const FormHeadLine(headline: 'Pictures Of Mouth'),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GridViewWidget(
                      imagesList: controller.caseModel.mouthImages),
                ),
                const SizedBox(
                  height: 20,
                ),
                const HDivider(),
                const SizedBox(
                  height: 20,
                ),
                const FormHeadLine(headline: 'X-Ray'),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: controller.caseModel.xrayImages.isNotEmpty
                      ? GridViewWidget(
                          imagesList: controller.caseModel.xrayImages,
                        )
                      : const Text(
                          "None",
                          style: Styles.textStyle16Grey,
                        ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const HDivider(),
                const SizedBox(
                  height: 20,
                ),
                const FormHeadLine(headline: 'Prescription'),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: controller.caseModel.prescriptionImages.isNotEmpty
                      ? GridViewWidget(
                          imagesList: controller.caseModel.prescriptionImages,
                        )
                      : const Text(
                          "None",
                          style: Styles.textStyle16Grey,
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
