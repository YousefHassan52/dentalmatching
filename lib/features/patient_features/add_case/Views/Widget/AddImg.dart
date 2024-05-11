import 'dart:io';

import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/features/patient_features/add_case/Controller/add_case_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddImageWidget extends StatelessWidget {
  final String img;
  final String txt;
  final void Function()? onPressed;

  const AddImageWidget(
      {Key? key, required this.img, required this.txt, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddCaseController controller = Get.find();
    return TextButton(
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.all(5),
        height: Get.height * 0.1,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.circleColor,
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: const AssetImage('assets/images/G.png'),
            colorFilter: ColorFilter.mode(
              const Color.fromARGB(255, 7, 66, 162)
                  .withOpacity(0.2), // Adjust the opacity (0.0 to 1.0)
              BlendMode.dstATop,
            ),
          ),
        ),
        child: FittedBox(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        txt,
                        style: Styles.textStyle16Grey,
                        textAlign: TextAlign.start,
                      ),
                      RichText(
                        text: TextSpan(
                          text: '*'.tr,
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'select at least 2 pictures'.tr,
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
                    child: SizedBox(
                      height: 60,
                      width: Get.width * 0.18,
                      child: SvgPicture.asset(img),
                    ),
                  ),
                ],
              ),
              //GetBuilder<AddCaseController>(
              //   builder: (controller) =>
              //       GridView.builder(
              //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //           crossAxisCount: 3, // Change this value according to your needs
              //           crossAxisSpacing: 4.0,
              //           mainAxisSpacing: 4.0,
              //         ),
              //         itemCount: controller.mouthImages!.length,
              //         itemBuilder: (BuildContext context, int index) {
              //           return Image.file(controller.mouthImages![index]);
              //         },
              //       ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
