import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CircleAvatarWidget extends StatelessWidget {
  final String imagePath;

  const CircleAvatarWidget({
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromARGB(218, 255, 255, 255),
      ),
      height: Get.width * 0.4,
      width: Get.width * 0.2,
      child: Center(
        child: SvgPicture.asset(
          imagePath,
        ),
      ),
    );
  }
}
