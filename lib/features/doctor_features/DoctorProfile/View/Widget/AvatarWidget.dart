import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AvatarWidget extends StatelessWidget {
  final String imagePath;

  const AvatarWidget({
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ClipOval(
          child: SizedBox.fromSize(
            size: Size.fromRadius(48),
            child: SvgPicture.asset(imagePath),
          ),
        ),
      ),
    );
  }
}
