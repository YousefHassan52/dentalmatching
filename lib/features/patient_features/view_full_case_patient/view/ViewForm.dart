// ignore: file_names
import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/features/patient_features/AddCase/Views/Widget/FormHeadLine.dart';
import 'package:dentalmatching/features/patient_features/AddCase/Views/Widget/HDivider.dart';
import 'package:dentalmatching/features/patient_features/AddCase/Views/Widget/OptionalText.dart';
import 'package:dentalmatching/features/patient_features/View_Cases/Controller/mycases_patient_controller_impl.dart';
import 'package:dentalmatching/features/patient_features/view_full_case_patient/controller/view_full_case_patient_controller_impl.dart';
import 'package:dentalmatching/features/patient_features/view_full_case_patient/view/Widget/ChronicList.dart';
import 'package:flutter/material.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/view/Widgets/Upper.dart';
import 'package:dentalmatching/features/patient_features/view_full_case_patient/view/Widget/GridViewWidget.dart';
import 'package:get/get.dart';
import 'package:popover/popover.dart';

class ViewForm extends StatelessWidget {
  const ViewForm({super.key});

  @override
  Widget build(BuildContext context) {
    ViewFullCasePatientControllerImpl controller =
        Get.put(ViewFullCasePatientControllerImpl());
    MyCasesPatientControllerImpl casesController = Get.find();
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: PopupMenuButton(
              child: const Icon(
                Icons.edit,
                color: AppColors.mainColor,
              ),
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: const Text("Edit"),
                  onTap: () {},
                ),
                PopupMenuItem(
                  child: const Text("Delete"),
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
            const UpperWidget(needBackButton: true),
            const SizedBox(
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: Get.width * 0.93,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(77, 207, 216, 220),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xff4A6BAD),
                  ),
                ),
                margin: const EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const FormHeadLine(headline: 'Describe what you feel'),
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
                      const FormHeadLine(headline: 'Chronic Diseases'),
                      controller.caseModel.chronicDiseases.isNotEmpty
                          ? ChronicOrDentalList(
                              list: controller.caseModel.chronicDiseases)
                          : const Text(
                              "None",
                              style: Styles.textStyleGrey,
                            ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: HDivider(),
                      ),
                      const FormHeadLine(headline: 'Do you know your case ?'),
                      controller.caseModel.isKnown == true
                          ? ChronicOrDentalList(
                              list: controller.caseModel.dentalDiseases)
                          : const Text(
                              "None",
                              style: Styles.textStyle16Grey,
                            ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: HDivider(),
                      ),
                      const FormHeadLine(headline: 'Pictures of your Mouth'),
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
                      const OptionalText(
                        text: 'X-Ray Images',
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
                            : const Text(
                                "None",
                                style: Styles.textStyle16Grey,
                              ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: HDivider(),
                      ),
                      const OptionalText(
                        text: 'Prescription Images',
                      ),
                      const SizedBox(
                        height: 10,
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
              ),
            ),
          ],
        ));
  }
}

// Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const UpperWidget(),
//           const SizedBox(
//             height: 2,
//           ),
//           const FormHeadLine(headline: 'Describe what you feel'),
//           Container(
//             margin: const EdgeInsets.all(4),
//             decoration: BoxDecoration(
//                 color: AppColors.circleColor,
//                 borderRadius: BorderRadius.circular(6)),
//             child: const Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Text(
//                 'Descriptionbsbbbbnbnbnbbmnbmnxbnbxnbmbmbm',
//                 style: TextStyle(
//                   color: AppColors.greyTextColor,
//                   fontSize: 15,
//                   fontWeight: FontWeight.w500,
//                   // backgroundColor: AppColors.circleColor,
//                 ),
//               ),
//             ),
//           ),
//           const Padding(
//             padding: EdgeInsets.all(8.0),
//             child: HDivider(),
//           ),
//           const FormHeadLine(headline: 'Chronic Diseases'),
//           ChronicList(),
//           const Padding(
//             padding: EdgeInsets.all(8.0),
//             child: HDivider(),
//           ),
//           const FormHeadLine(headline: 'Do you know your case ?'),
//           const Padding(
//             padding: EdgeInsets.all(8.0),
//             child: HDivider(),
//           ),
//           const Expanded(
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 8.0),
//               child: GridViewWidget(),
//             ),
//           ),
//         ],
//       ),