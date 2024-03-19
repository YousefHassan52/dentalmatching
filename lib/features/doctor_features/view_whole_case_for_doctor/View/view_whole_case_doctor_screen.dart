import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/controller/unassigned_cases_doctor_controller_impl.dart';
import 'package:dentalmatching/features/doctor_features/get_doctor_cases/controller/get_doctor_cases_controller_impl.dart';
import 'package:dentalmatching/features/doctor_features/view_whole_case_for_doctor/View/Widgets/AppointmentScreen.dart';
import 'package:dentalmatching/features/doctor_features/view_whole_case_for_doctor/View/Widgets/BoxWidget.dart';
import 'package:dentalmatching/features/doctor_features/view_whole_case_for_doctor/View/Widgets/RequestButton.dart';
import 'package:dentalmatching/features/doctor_features/view_whole_case_for_doctor/View/Widgets/UpperNot.dart';
import 'package:dentalmatching/features/doctor_features/view_whole_case_for_doctor/controller/AppointmentController.dart';
import 'package:dentalmatching/features/doctor_features/view_whole_case_for_doctor/controller/view_whole_case_doctor_controller_impl.dart';
import 'package:dentalmatching/features/patient_features/AddCase/Views/Widget/FormHeadLine.dart';
import 'package:dentalmatching/features/patient_features/AddCase/Views/Widget/HDivider.dart';
import 'package:dentalmatching/features/patient_features/view_full_case_patient/view/Widget/ChronicList.dart';
import 'package:dentalmatching/features/patient_features/view_full_case_patient/view/Widget/GridViewWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewWholeCaseForDoctor extends StatelessWidget {
  const ViewWholeCaseForDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    AppointmentController appointmentController =
        Get.put(AppointmentController());
    ViewWholeCaseDoctorControllerImpl controller =
        Get.put(ViewWholeCaseDoctorControllerImpl());
    UnassignedCasesDoctorControllerImpl reloadDataControllerForAllCases =
        Get.put(UnassignedCasesDoctorControllerImpl());
    GetDocotorCasesControllerImpl reloadDataControllerForDoctorCases =
        Get.put(GetDocotorCasesControllerImpl());
    ScrollController scrollController = ScrollController();

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              controller: scrollController,
              padding: const EdgeInsets.only(top: 0, bottom: 5),
              children: [
                const UpperFullCaseWidget(
                  text: "Patient Details       ",
                  needBackButton: true,
                  CaseDesc: true,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // BioBoxWidget(controller: controller),
                      // if (controller.caseModel.isAssigned == false)
                      //   RequestButton(
                      //     onPressed: () {
                      //       controller
                      //           .requestCase(
                      //               caseId: controller.caseModel.caseId)
                      //           .then((value) {
                      //         reloadDataControllerForAllCases.getCases();
                      //         reloadDataControllerForDoctorCases.getCases();
                      //       });
                      //     },
                      //   ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      // const HDivider(),
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
                      const FormHeadLine(headline: 'Dental Diseases'),
                      BoxWidget(
                        widget: controller.caseModel.isKnown == true
                            ? ChronicOrDentalList(
                                list: controller.caseModel.dentalDiseases)
                            : const Text(
                                "None",
                                style: Styles.textStyle16Grey,
                              ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const HDivider(),

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
                        child:
                            controller.caseModel.prescriptionImages.isNotEmpty
                                ? GridViewWidget(
                                    imagesList:
                                        controller.caseModel.prescriptionImages,
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
          ),
          GetBuilder<ViewWholeCaseDoctorControllerImpl>(
            builder: (controller) {
              if (!controller.caseModel.isAssigned) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RequestButton(
                    onPressed: () {
                      controller
                          .requestCase(caseId: controller.caseModel.caseId)
                          .then((value) {
                        // Update the state to reflect that the case is now assigned
                        controller.updateAssignmentStatus(true);
                        reloadDataControllerForAllCases.getCases();
                        reloadDataControllerForDoctorCases.getCases();
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return Center(child: AppointmentScreen());
                          },
                        );

                        // Get.dialog(
                        //   AlertDialog(
                        //     title: const Text("Success"),
                        //     content: const Text("Case assigned successfully!"),
                        //     actions: [
                        //       MaterialButton(
                        //         child: const Text("OK"),
                        //         onPressed: () {
                        //           Get.back(); // Close the dialog
                        //           scrollController.animateTo(0, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut); // Scroll to the top
                        //         },
                        //       ),
                        //     ],
                        //   ),
                        // );
                      });
                    },
                  ),
                );
              } else {
                return const SizedBox(); // Return an empty SizedBox to hide the button
              }
            },
          ),
        ],
      ),
    );
  }
}




                // Container(
                //   margin: const EdgeInsets.all(20),
                //   child: FittedBox(
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         BioWidget(
                //           title: 'Address',
                //           subTitle: controller.caseModel.patientCity,
                //         ),
                //         BioWidget(
                //           title: 'Age',
                //           subTitle: "${controller.caseModel.patientAge}",
                //         ),
                //         BioWidget(
                //           title: 'Case Status',
                //           subTitle: controller.caseModel.isKnown == true
                //               ? "Known"
                //               : "Unkown",
                //         ),
                //         GetBuilder<ViewWholeCaseDoctorControllerImpl>(
                //           builder: (internalController) {
                //             if (controller.caseModel.isAssigned == true) {
                //               return Column(
                //                 children: [
                //                   const SizedBox(
                //                     height: 20,
                //                   ),
                //                   BioWidget(
                //                     title: 'Phone number',
                //                     subTitle: internalController
                //                         .caseModel.phoneNumber,
                //                   ),
                //                 ],
                //               );
                //             }
                //             if (controller.requestStatus ==
                //                 RequestStatus.LOADING) {
                //               return const SizedBox(
                //                 height: 20,
                //                 width: 20,
                //                 child: CircularProgressIndicator(
                //                   backgroundColor: AppColors.mainColor,
                //                   color: AppColors.secondColor,
                //                 ),
                //               );
                //             } else if (internalController.viewPhone == true &&
                //                 controller.requestStatus ==
                //                     RequestStatus.SUCCESS) {
                //               return Column(
                //                 children: [
                //                   const SizedBox(
                //                     height: 20,
                //                   ),
                //                   BioWidget(
                //                     title: 'Phone number',
                //                     subTitle: internalController
                //                         .caseModel.phoneNumber,
                //                   ),
                //                 ],
                //               );
                //             } else {
                //               return BioWidget(
                //                 isLongText: true,
                //                 title: 'Phone Number',
                //                 subTitle: "None",
                //               );
                //             }
                //           },
                //         ),
                //       ],
                //     ),
                //   ),
                // ),