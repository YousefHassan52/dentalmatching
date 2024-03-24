import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/features/patient_features/View_Cases/Controller/mycases_patient_controller_impl.dart';
import 'package:dentalmatching/features/patient_features/patient_data_viewer/pateint_data_controller.dart';
import 'package:dentalmatching/features/patient_features/view_full_case_patient/controller/view_full_case_patient_controller_impl.dart';
import 'package:dentalmatching/features/patient_features/view_full_case_patient/view/Widget/BioWidgetDr.dart';
import 'package:dentalmatching/features/patient_features/view_full_case_patient/view/Widget/DateTimePatientWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class UpperAssigned extends StatelessWidget {
  const UpperAssigned(
      {super.key,
      this.needBackButton = false,
      required this.text,
      this.welcome = true});
  final bool needBackButton;
  final String text;
  final bool welcome;

  @override
  Widget build(BuildContext context) {
    ViewFullCasePatientControllerImpl controller =
        Get.put(ViewFullCasePatientControllerImpl());
    MyCasesPatientControllerImpl casesController = Get.find();
    Get.put(PatientDataController());

    // momken te7tag hena controller mo5tlef
    //double upperPartHeight = Get.height * 0.2;
    return Container(
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
        child: Container(
          padding: const EdgeInsets.all(0),
          //  height: upperPartHeight + 100,
          child: Center(
            child: Column(
              children: [
                if (needBackButton == true)
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 35, left: 5, bottom: 10),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        if (welcome == false)
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                text,
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                if (controller.caseModel.isAssigned ==
                    true) // yeb2a 24t8al hena we 23mel el widget mn gded
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        // Row(
                        //   children: [
                        //     const Flexible(
                        //       child: FittedBox(
                        //         fit: BoxFit.scaleDown,
                        //         child: SizedBox(
                        //           height: 60,
                        //           child: CircleAvatarWidget(
                        //               imagePath: 'assets/svg/profile.svg'),
                        //         ),
                        //       ),
                        //     ),
                        //     Flexible(
                        //       child: FittedBox(
                        //         fit: BoxFit.scaleDown,
                        //         child: Text(
                        //           'Dr.{$controller.caseModel.doctorName!}',
                        //           style: const TextStyle(
                        //               color: Colors.white,
                        //               fontWeight: FontWeight.w800,
                        //               fontSize: 20),
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        BioWidgetDr(
                          title: 'Dr.'.tr,
                          subTitle: controller.caseModel.doctorName!,
                        ),
                        BioWidgetDr(
                          title: 'Location :'.tr,
                          subTitle: controller.caseModel.doctorUniversity!,
                          isLocation: true,
                          onPressed: () async {
                            final Uri _url = Uri.parse(
                                '${controller.caseModel.googleMapLink}');
                            if (!await launchUrl(_url)) {
                              throw Exception('Could not launch $_url');
                            }
                          },
                        ),
                        if (controller.caseModel.isAssigned == true)
                          DateTimePatientWidget(
                            controller: controller,
                            txt: formatDate(
                                controller.caseModel.appointmentDateTime!),
                            text: 'Date : ',
                          ),
                        if (controller.caseModel.isAssigned == true)
                          DateTimePatientWidget(
                            controller: controller,
                            txt: formatTime(
                                controller.caseModel.appointmentDateTime!),
                            text: 'Time : ',
                          ),
                        BioWidgetDr(
                          title: 'Phone Number :'.tr,
                          subTitle: controller.caseModel.phoneNumber,
                        ),
                        // Text(controller.caseModel.doctorName!),
                        // Text(controller.caseModel.doctorUniversity!),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String formatDate(String dateTimeString) {
  final dateTime = DateTime.parse(dateTimeString);
  final formattedDate =
      '${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}';
  return formattedDate;
}
