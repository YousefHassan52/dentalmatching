import 'package:dentalmatching/features/common_faetures/onboarding/view/widgets/button.dart';
import 'package:dentalmatching/features/common_faetures/onboarding/view/widgets/dots.dart';
import 'package:flutter/material.dart';

class OnboardingLowerWidgets extends StatelessWidget {
  const OnboardingLowerWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        OnboardingDots(),
        SizedBox(
          height: 15,
        ),
        OnboardingButton(),
      ],
    );
  }
}
