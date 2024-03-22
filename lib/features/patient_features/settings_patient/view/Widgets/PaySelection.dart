import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/localization/translation_controller.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/controller/settings_controller_imp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class LanguageSelectionController extends GetxController {
//   RxBool visible = false.obs;

//   void trueVisibility() {
//     visible = true.obs;
//     update();
//   }
// }

class PaySelection extends StatelessWidget {
  const PaySelection({super.key, required this.txt, required this.txt1, required this.txt2, required this.onPressed, required this.onPressed1, required this.onPressed2});
  final String txt;
  final String txt1;
  final String txt2;
  final void Function() onPressed;
  final void Function() onPressed1;
  final void Function() onPressed2;

  @override
  Widget build(BuildContext context) {
    final SettingsPatientControllerImp controller =
        Get.put(SettingsPatientControllerImp());
    TranslationController translationController =
        Get.put(TranslationController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MaterialButton(
          onPressed: onPressed,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      txt.tr,
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: AppColors.mainColor),
                    ),
                  ),
                ),
                const Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Icon(
                      Icons.payment_outlined,
                      color: AppColors.blueLightTextColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        GetBuilder<SettingsPatientControllerImp>(
          builder: (controller) {
            if (controller.visiblePay.value) {
            
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    MaterialButton(
                      onPressed: onPressed1,
                      child:  FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          txt1.tr,
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: AppColors.mainColor),
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: onPressed2,
                      child:  FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          txt2.tr,
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: AppColors.mainColor),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const SizedBox(); // Return an empty sized box when not visible
            }
          },
        ),
      ],
    );
  }
}