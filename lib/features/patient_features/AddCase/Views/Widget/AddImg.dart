import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AddImageWidget extends StatelessWidget {
  final String img;
  final String txt;
  final void Function()? onPressed;

  const AddImageWidget(
      {Key? key, required this.img, required this.txt, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        height: Get.height * 0.1,
        decoration: BoxDecoration(
          color: AppColors.circleColor,
          borderRadius: BorderRadius.circular(20),
          // boxShadow: [
          //   BoxShadow(
          //     color: Color(0xFF2C5390).withOpacity(0.2),
          //     spreadRadius: 1,
          //     blurRadius: 3,
          //   ),
          // ],
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/G.png'),
            colorFilter: ColorFilter.mode(
              Color.fromARGB(255, 7, 66, 162)
                  .withOpacity(0.2), // Adjust the opacity (0.0 to 1.0)
              BlendMode.dstATop,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  txt,
                  style: Styles.textStyle16Grey,
                ),
                RichText(
                  text: const TextSpan(
                    text: '*',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'select at least 2 pictures',
                        style: Styles.textStyle16Grey,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Center(
              child: Container(
                height: 60,
                width: Get.width * 0.18,
                child: SvgPicture.asset(img),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
