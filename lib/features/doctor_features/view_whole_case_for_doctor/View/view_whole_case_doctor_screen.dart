// ignore_for_file: avoid_print

import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/routes_names.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/core/shared/dailogue_with_buttons.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/controller/unassigned_cases_doctor_controller_impl.dart';
import 'package:dentalmatching/features/doctor_features/get_doctor_cases/controller/get_doctor_cases_controller_impl.dart';
import 'package:dentalmatching/features/doctor_features/view_whole_case_for_doctor/view/widgets/appointment_screen.dart';
import 'package:dentalmatching/features/doctor_features/view_whole_case_for_doctor/view/widgets/request_button.dart';
import 'package:dentalmatching/features/doctor_features/view_whole_case_for_doctor/view/widgets/upper_not.dart';
import 'package:dentalmatching/features/common_faetures/dental_case_comments/view/comments.dart';
import 'package:dentalmatching/features/doctor_features/report_case/view/report_button.dart';
import 'package:dentalmatching/features/doctor_features/view_whole_case_for_doctor/view/widgets/box_widget.dart';
import 'package:dentalmatching/features/doctor_features/view_whole_case_for_doctor/controller/view_whole_case_doctor_controller_impl.dart';
import 'package:dentalmatching/features/patient_features/add_case/views/Widget/form_headline.dart';
import 'package:dentalmatching/features/patient_features/add_case/views/Widget/divider.dart';
import 'package:dentalmatching/features/patient_features/view_full_case_patient/view/widget/chronic_list.dart';
import 'package:dentalmatching/features/patient_features/view_full_case_patient/view/widget/grid_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewWholeCaseForDoctor extends StatelessWidget {
  const ViewWholeCaseForDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    ViewWholeCaseDoctorControllerImpl controller =
        Get.put(ViewWholeCaseDoctorControllerImpl());

    ScrollController scrollController = ScrollController();
    MyServices languageController = Get.find();

    return Scaffold(
      body: ListView(
        controller: scrollController,
        padding: EdgeInsets.zero,
        children: [
          UpperFullCaseWidget(
            text: "Patient Details       ".tr,
            needBackButton: true,
            CaseDesc: true,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                GetBuilder<ViewWholeCaseDoctorControllerImpl>(
                  builder: (controller) {
                    if (controller.caseModel.isAssigned == true) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FormHeadLine(headline: 'Progress'.tr),
                              IconButton(
                                onPressed: () {
                                  Get.toNamed(AppRoutes.progressScreen,
                                      arguments: {
                                        "caseId": controller.caseModel.caseId
                                      });
                                },
                                icon: languageController.sharedPref
                                            .getString("lang") ==
                                        "en"
                                    ? const Icon(
                                        Icons.arrow_circle_right_rounded,
                                        color: AppColors.mainColor,
                                      )
                                    : const Icon(
                                        Icons.arrow_circle_left_rounded,
                                        color: AppColors.mainColor,
                                      ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const HDivider(),
                        ],
                      );
                    } else {
                      return const SizedBox
                          .shrink(); // Or handle case when not assigned
                    }
                  },
                ),
                FormHeadLine(headline: 'Description'.tr),
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
                FormHeadLine(headline: 'Chronic Diseases'.tr),
                const SizedBox(
                  height: 20,
                ),
                BoxWidget(
                  widget: controller.caseModel.chronicDiseases.isNotEmpty
                      ? ChronicOrDentalList(
                          list: controller.caseModel.chronicDiseases)
                      : Text(
                          "None".tr,
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
                FormHeadLine(headline: 'Dental Diseases'.tr),
                BoxWidget(
                  widget: controller.caseModel.isKnown == true
                      ? ChronicOrDentalList(
                          list: controller.caseModel.dentalDiseases)
                      : Text(
                          "None".tr,
                          style: Styles.textStyle16Grey,
                        ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const HDivider(),
                FormHeadLine(headline: 'Pictures Of Mouth'.tr),
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
                FormHeadLine(headline: 'X-Ray'.tr),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: controller.caseModel.xrayImages.isNotEmpty
                      ? GridViewWidget(
                          imagesList: controller.caseModel.xrayImages,
                        )
                      : Text(
                          "None".tr,
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
                FormHeadLine(headline: 'Prescription'.tr),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: controller.caseModel.prescriptionImages.isNotEmpty
                      ? GridViewWidget(
                          imagesList: controller.caseModel.prescriptionImages,
                        )
                      : Text(
                          "None".tr,
                          style: Styles.textStyle16Grey,
                        ),
                ),
              ],
            ),
          ),
          if (!controller.caseModel.isAssigned)
            CommentsOnCase(
                token: controller.doctorModel.token,
                caseid: controller.caseModel.caseId),
          GetBuilder<ViewWholeCaseDoctorControllerImpl>(
            builder: (controller) {
              if (!controller.caseModel.isAssigned) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RequestAndCancelButton(
                    onPressed: () {
                      scrollController.animateTo(0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return Center(child: AppointmentScreen());
                        },
                      );
                    },
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RequestAndCancelButton(
                            isCancelButton: true,
                            onPressed: () {
                              customDialogeWithButtons(
                                  title: "Warning".tr,
                                  middleText:
                                      "Are you Sure you Want to Cancel this Request?"
                                          .tr,
                                  confirm: () {
                                    print(controller.caseModel.caseId);

                                    controller.cancelCase().then((value) {
                                      UnassignedCasesDoctorControllerImpl
                                          reloadDataControllerForAllCases =
                                          Get.put(
                                              UnassignedCasesDoctorControllerImpl());
                                      GetDocotorCasesControllerImpl
                                          reloadDataControllerForDoctorCases =
                                          Get.put(
                                              GetDocotorCasesControllerImpl());
                                      reloadDataControllerForAllCases
                                          .getCases();
                                      reloadDataControllerForDoctorCases
                                          .getCases();
                                    });
                                    Get.back();
                                  });
                            },
                          ),
                        ),
                      ),
                      ReportButton(
                        caseId: controller.caseModel.caseId,
                      ),

                      // Small button widget goes here
                    ],
                  ),
                );
                // Return an empty SizedBox to hide the button
              }
            },
          ),
        ],
      ),
    );
  }
}
