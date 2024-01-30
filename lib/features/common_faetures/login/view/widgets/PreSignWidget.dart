
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../screens/SignUp.dart';

class PreSignUpWidget extends StatelessWidget {
  const PreSignUpWidget({super.key, /*required this.image,*/ required this.userType});

  //final String image;
  final String userType;

  @override
  Widget build(BuildContext context) {
    

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: Get.width * 0.2),
          child: GestureDetector(
            onTap: () => Get.offNamed(AppRoutes.signup),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.circleColor,
              ),
              height: Get.width * 0.4,
              width: Get.width * 0.8,
              // child: SvgPicture.asset(
              //   image,
              //   height: Get.width * 0.35,
              // ),
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
