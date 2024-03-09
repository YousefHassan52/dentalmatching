import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/View/Widget/AvatarWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrProfileWidget extends StatelessWidget {
  final String title;
  final String name;

  const DrProfileWidget({super.key, required this.title, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: Get.width * 0.05, horizontal: Get.width * 0.03),
          child: const AvatarWidget(
            imagePath: 'assets/svg/pp.svg',
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 250,
              alignment: Alignment.centerLeft,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: RichText(
                  text: TextSpan(
                    text: title,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              width: 250,
              alignment: Alignment.centerLeft,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: RichText(
                  text: TextSpan(
                    text: name,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            // Text(
            //   name,
            //   style: const TextStyle(
            //     fontSize: 15,
            //     fontWeight: FontWeight.bold,
            //     color: Colors.white,
            //   ),
            // ),
          ],
        ),
        // IconButton(
        //   onPressed: () {},
        //   icon: SvgPicture.asset("assets/svg/editButton.svg"),
        // )
      ],
    );
  }
}
