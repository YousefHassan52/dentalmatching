import 'package:dentalmatching/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PreSignUpWidget extends StatelessWidget {
  const PreSignUpWidget({
    super.key,
    required this.role,
    required this.image,
    required this.onTap,
  });
  final String role;
  final String image;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: FittedBox(
        child: Column(
          children: [
            Container(
              height: Get.height * 0.5,
              margin: const EdgeInsets.symmetric(vertical: 4),
              decoration: const BoxDecoration(),
              child: SvgPicture.asset(image),
            ),
            Text(
              role,
              style:
                  const TextStyle(fontSize: 80, color: AppColors.blueTextColor),
            )
          ],
        ),
      ),
    );
  }
}
