import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/features/admin_doctor_features/view_whole_case/controller/view_case_controller_impl.dart';
import 'package:dentalmatching/features/admin_doctor_features/view_whole_case/view/dental_cases_widget.dart';
import 'package:dentalmatching/features/admin_doctor_features/view_whole_case/view/upper_widget.dart';
import 'package:dentalmatching/features/common_faetures/loginn/view/widgets/auth_button.dart';
import 'package:dentalmatching/features/doctor_features/view_whole_case_for_doctor/View/Widgets/BoxWidget.dart';
import 'package:dentalmatching/features/doctor_features/view_whole_case_for_doctor/View/Widgets/UpperNot.dart';
import 'package:dentalmatching/features/patient_features/AddCase/Views/Widget/CasesCheckList.dart';
import 'package:dentalmatching/features/patient_features/AddCase/Views/Widget/FormHeadLine.dart';
import 'package:dentalmatching/features/patient_features/AddCase/Views/Widget/HDivider.dart';
import 'package:dentalmatching/features/patient_features/view_full_case_patient/view/Widget/ChronicList.dart';
import 'package:dentalmatching/features/patient_features/view_full_case_patient/view/Widget/GridViewWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewWholeCaseForAdmin extends StatelessWidget {
  const ViewWholeCaseForAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    ViewWholeCaseForAdminControllerImp controller =
        Get.put(ViewWholeCaseForAdminControllerImp());

    ScrollController scrollController = ScrollController();

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
        ),
        title: Text(
          "DentaMatch",
          style: Styles.mediumTitle.copyWith(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              controller: scrollController,
              padding: const EdgeInsets.only(top: 0, bottom: 5),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BioBarWidgetAdmin(),
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
                      const SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: AuthButton(
                buttonText: "Classify",
                onTap: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          child: const Column(
                            children: [
                              Text(
                                'Dental Cases',
                                style: TextStyle(fontSize: 20),
                              ),
                              DentalCasesList(),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}
