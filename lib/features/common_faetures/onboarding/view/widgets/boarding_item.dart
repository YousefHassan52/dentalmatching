import 'package:dentalmatching/features/common_faetures/onboarding/data/models/onboarding.dart';
import 'package:flutter/material.dart';

class CustomOnboardingItem extends StatelessWidget {
  const CustomOnboardingItem({Key? key, required this.item}) : super(key: key);
  final OnboardingModel item;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(item.title),
        Image.asset(item.image),
        Text(item.desc),
      ],
    );
  }
}
