import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'CircleAvatarWidget.dart';

class UserProfileWidget extends StatelessWidget {
  final String title;
  final String name;

  const UserProfileWidget({super.key, required this.title, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: Get.width * 0.05, horizontal: Get.width * 0.02),
          child: const CircleAvatarWidget(
            imagePath: 'assets/svg/pp.svg',
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            Container(
              width: 250,
              alignment: Alignment.centerLeft,
              child: FittedBox(
               fit: BoxFit.scaleDown,
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        // IconButton(
        //   onPressed: () {},
        //   icon: SvgPicture.asset("assets/svg/editButton.svg"),
        // )
        //  IconButton(onPressed:() {
        //       Get.to(DrProfile());
        //     },
        //      icon: Icon(Icons.gamepad_outlined))
      ],
    );
  }
}
