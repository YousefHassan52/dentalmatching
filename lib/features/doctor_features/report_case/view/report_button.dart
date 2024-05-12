import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/features/doctor_features/report_case/controller/report_controller_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportButton extends StatelessWidget {
  const ReportButton({
    super.key,
    required this.caseId,
  });
  final String caseId;

  @override
  Widget build(BuildContext context) {
    Get.put(ReportControllerImpl());
    return Expanded(
      flex: 1,
      child: GetBuilder<ReportControllerImpl>(builder: (controller) {
        if (controller.requestStatus == RequestStatus.LOADING) {
          return const CircularProgressIndicator(
            color: AppColors.mainColor,
          );
        } else {
          return SizedBox(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromARGB(255, 209, 88, 7),
                        Color.fromRGBO(228, 99, 40, 0.475),
                      ]),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: MaterialButton(
                  onPressed: () {
                    controller.reportCase(caseId: caseId);
                  },
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    "Report".tr,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      }),
    );
  }
}
