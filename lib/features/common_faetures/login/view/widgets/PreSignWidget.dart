
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../screens/SignUp.dart';

class PreSignUpWidget extends StatelessWidget {
  const PreSignUpWidget({super.key, required this.image, required this.userType});

  final String image;
  final String userType;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: screenWidth * 0.2),
          child: GestureDetector(
            onTap: () => Get.off(SignUp()),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(20, 68, 100, 160),
              ),
              height: screenWidth * 0.4,
              width: screenWidth * 0.8,
              child: SvgPicture.asset(
                image,
                height: screenWidth * 0.35,
              ),
            ),
          ),
        ),
        Text(
          userType,
          style: TextStyle(
            fontSize: screenWidth * 0.07,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1E496B),
          ),
        ),
      ],
    );
  }
}
