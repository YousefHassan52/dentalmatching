// ignore: file_names
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/routes_names.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/features/common_faetures/dental_case_comments/view/comments.dart';
import 'package:dentalmatching/features/patient_features/add_case/Views/Widget/FormHeadLine.dart';
import 'package:dentalmatching/features/patient_features/add_case/Views/Widget/HDivider.dart';
import 'package:dentalmatching/features/patient_features/add_case/Views/Widget/OptionalText.dart';
import 'package:dentalmatching/features/patient_features/view_cases/Controller/mycases_patient_controller_impl.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/view/Widgets/Upper.dart';
import 'package:dentalmatching/features/patient_features/view_full_case_patient/controller/view_full_case_patient_controller_impl.dart';
import 'package:dentalmatching/features/patient_features/view_full_case_patient/view/Widget/ChronicList.dart';
import 'package:dentalmatching/features/patient_features/view_full_case_patient/view/Widget/upperAssigned.dart';
import 'package:flutter/material.dart';
import 'package:dentalmatching/features/patient_features/view_full_case_patient/view/Widget/GridViewWidget.dart';
import 'package:get/get.dart';

class ViewForm extends StatelessWidget {
  const ViewForm({super.key});

  @override
  Widget build(BuildContext context) {
    ViewFullCasePatientControllerImpl controller =
        Get.put(ViewFullCasePatientControllerImpl());
    MyCasesPatientControllerImpl casesController = Get.find();
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: PopupMenuButton(
              child: const Icon(
                Icons.edit,
                size: 35,
                color: AppColors.mainColor,
              ),
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text("Edit".tr),
                  onTap: () {
                    Get.toNamed(AppRoutes.editCase,
                        arguments: {"edit_case": controller.caseModel});
                  },
                ),
                PopupMenuItem(
                  child: Text("Delete".tr),
                  onTap: () {
                    controller.deleteCase().then((value) {
                      casesController.getCases();
                    });
                  },
                ),
              ],
            )),
        body: ListView(
          padding: const EdgeInsets.only(top: 0),
          children: [
            if (controller.caseModel.isAssigned == false)
              UpperWidget(
                needBackButton: true,
                text: 'Case Detailes        '.tr,
                welcome: false,
              ),
            if (controller.caseModel.isAssigned == true)
              UpperAssigned(
                text: 'Case Detailes        '.tr,
                needBackButton: true,
                welcome: false,
              ),
            const SizedBox(
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FormHeadLine(headline: 'Describe what you feel'.tr),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(62, 73, 119, 192),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(controller.caseModel.description,
                          style: Styles.textStyle16Grey),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: HDivider(),
                  ),
                  FormHeadLine(headline: 'Chronic Diseases'.tr),
                  controller.caseModel.chronicDiseases.isNotEmpty
                      ? ChronicOrDentalList(
                          list: controller.caseModel.chronicDiseases)
                      : Text(
                          "None".tr,
                          style: Styles.textStyleGrey,
                        ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: HDivider(),
                  ),
                  FormHeadLine(headline: 'Do you know your case ?'.tr),
                  controller.caseModel.isKnown == true
                      ? ChronicOrDentalList(
                          list: controller.caseModel.dentalDiseases)
                      : Text(
                          "None".tr,
                          style: Styles.textStyle16Grey,
                        ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: HDivider(),
                  ),
                  FormHeadLine(headline: 'Pictures of your Mouth'.tr),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GridViewWidget(
                        imagesList: controller.caseModel.mouthImages),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: HDivider(),
                  ),
                  OptionalText(
                    text: 'X-Ray Images'.tr,
                  ),
                  const SizedBox(
                    height: 10,
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
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: HDivider(),
                  ),
                  OptionalText(
                    text: 'Prescription Images'.tr,
                  ),
                  const SizedBox(
                    height: 10,
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
                  const HDivider(),
                  FormHeadLine(headline: 'Comments'.tr),
                  CommentsOnCase(
                    caseid: controller.caseModel.caseId,
                    token: controller.patient.token,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
