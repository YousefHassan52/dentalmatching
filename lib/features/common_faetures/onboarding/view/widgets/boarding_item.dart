import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/features/common_faetures/onboarding/data/models/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomOnboardingItem extends StatelessWidget {
  const CustomOnboardingItem({Key? key, required this.item}) : super(key: key);
  final OnboardingModel item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          SvgPicture.asset(item.image, height: Get.height * 0.4),
          Row(
            children: [
              Expanded(
                child: Text(
                  item.title,
                  style: Styles.extraLargetitle,
                ),
              ),
            ],
          ),
          Expanded(
            child: Text(
              item.desc,
              style: Styles.textStyle16,
            ),
          ),
        ],
      ),
    );
  }
}
