import 'package:dentalmatching/features/common_faetures/onboarding/controller/imp_controller.dart';
import 'package:dentalmatching/features/common_faetures/onboarding/view/widgets/lower_widgets_onboarding.dart';
import 'package:dentalmatching/features/common_faetures/onboarding/view/widgets/upper_widgets_onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Expanded(flex: 5, child: OnboardingPageBuilder()),
          const Expanded(flex: 1, child: OnboardingLowerWidgets())
        ],
      ),
    );
  }
}
