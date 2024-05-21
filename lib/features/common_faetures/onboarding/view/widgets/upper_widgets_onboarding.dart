import 'package:dentalmatching/features/common_faetures/onboarding/controller/imp_controller.dart';
import 'package:dentalmatching/features/common_faetures/onboarding/data/data_source/static.dart';
import 'package:dentalmatching/features/common_faetures/onboarding/view/widgets/boarding_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingPageBuilder extends StatelessWidget {
  OnboardingPageBuilder({
    super.key,
  });
  final OnboardingControllerImp controller = Get.find(); // find instance

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (index) {
        controller.onPageChanged(index);
      },
      itemCount: onboardingList.length,
      itemBuilder: (context, index) => CustomOnboardingItem(
        item: onboardingList[index],
        index: index,
      ),
    );
  }
}
