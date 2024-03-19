import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class UpperSignupWidget extends StatelessWidget {
  const UpperSignupWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //double upperPartHeight = Get.height * 0.2;

    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage("assets/images/signup.png"))),
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            color: AppColors.mainColor.withOpacity(0.8)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                IconButton(
                  icon: SvgPicture.asset(
                      "assets/svg/double_back_button_white.svg"),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ],
            ),
            Container(
              constraints: BoxConstraints(maxWidth: Get.width),
              child: Text(
                "Personal Information",
                overflow: TextOverflow.ellipsis,
                style: Styles.largetitle.copyWith(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
