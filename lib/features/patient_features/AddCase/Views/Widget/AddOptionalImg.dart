import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AddOptionalImg extends StatelessWidget {
  final String img;
  final String txt;
  final void Function()? onPressed;
  const AddOptionalImg(
      {Key? key, required this.img, required this.txt, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: onPressed,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              width: constraints.maxWidth,
              height: Get.height * 0.06,
              decoration: BoxDecoration(
                color: AppColors.circleColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.blueLightTextColor.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 3,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    txt,
                    style: Styles.textStyle16Grey,
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Center(
                    child: Container(
                      height: 50,
                      width: Get.width * 0.18,
                      child: SvgPicture.asset(img),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
