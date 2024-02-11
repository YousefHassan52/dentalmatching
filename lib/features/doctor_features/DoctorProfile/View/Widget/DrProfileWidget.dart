import 'package:dentalmatching/features/doctor_features/DoctorProfile/View/Widget/AvatarWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
          padding:  EdgeInsets.symmetric(vertical:Get.width* 0.05,horizontal:Get.width* 0.03 ),
          child: const AvatarWidget(
            imagePath: 'assets/svg/pp.svg',
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              name,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
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
