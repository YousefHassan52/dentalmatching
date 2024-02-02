import 'package:dentalmatching/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PreSignUpWidget extends StatelessWidget {
  const PreSignUpWidget({super.key, required this.image, required this.userType,required this.onTap});

  final String image;
  final String userType;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: Get.width * 0.2),
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.circleColor,
              ),
              height: Get.width * 0.4,
              width: Get.width * 0.8,
              child: Center(
                child: SvgPicture.asset(
                  image,
                  height: Get.width * 0.36,
                ),
              ),
            ),
          ),
        ),
        Text(
          userType,
          style: TextStyle(
            fontSize: Get.width * 0.07,
            fontWeight: FontWeight.bold,
            color: AppColors.blueTextColor,
          ),
        ),
      ],
    );
  }
}
