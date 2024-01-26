import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/features/common_faetures/onboarding/controller/imp_controller.dart';
import 'package:dentalmatching/features/common_faetures/onboarding/data/data_source/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingButton extends StatelessWidget {
  const OnboardingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingControllerImp>(
        builder: (internalController) => MaterialButton(
              onPressed: () {
                internalController.next();
              },
              color: AppColors.mainColor,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    20), // Adjust the value to change corner radius
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 70),
                child:
                    internalController.currentPage < onboardingList.length - 1
                        ? const Text("Continue")
                        : const Text("Login   "),
              ),
            ));
  }
}
