import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/features/common_faetures/onboarding/data/models/onboarding.dart';
import 'package:dentalmatching/features/common_faetures/onboarding/view/widgets/animatedsvg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomOnboardingItem extends StatelessWidget {
  const CustomOnboardingItem({Key? key, required this.item}) : super(key: key);
  final OnboardingModel item;
  @override
  Widget build(BuildContext context) {
    MyServices languageController = Get.find();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Usage
          Expanded(
            flex: 4,
            child: BreathingAnimatedSvg(
              imagePath: item.image,
              height: Get.height * 0.4,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              item.title,
              style: Styles.extraLargetitle,
            ),
          ),
          if(languageController.sharedPref.getString("lang") == "en")
          Expanded(
            flex: 2,
            child: Text(item.small!,
                style: const TextStyle(
                    color: AppColors.mainColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 42,
                    letterSpacing: 4)),
          ),
          if(languageController.sharedPref.getString("lang") == "ar")
          Expanded(
            flex: 2,
            child: Text(item.small!,
                style: const TextStyle(
                  color: AppColors.mainColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 42,
                )),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: Text(
                item.desc,
                textAlign: TextAlign.center,
                style: Styles.textStyle16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
