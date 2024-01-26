import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/features/common_faetures/onboarding/controller/imp_controller.dart';
import 'package:dentalmatching/features/common_faetures/onboarding/data/data_source/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingDots extends StatelessWidget {
  const OnboardingDots({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingControllerImp>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  onboardingList.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: controller.currentPage == index ? 10 : 4,
                    height: 4,
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ));
  }
}
