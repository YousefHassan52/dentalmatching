import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
        const Padding(
          padding: EdgeInsets.only(left: 15, top: 2),
          child: CircleAvatarWidget(
            imagePath: 'assets/svg/pp.svg',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 100),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Padding(
                padding: EdgeInsets.only(right: Get.width * 0.09),
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        // IconButton(
        //   onPressed: () {},
        //   icon: SvgPicture.asset("assets/svg/editButton.svg"),
        // )
      ],
    );
  }
}
