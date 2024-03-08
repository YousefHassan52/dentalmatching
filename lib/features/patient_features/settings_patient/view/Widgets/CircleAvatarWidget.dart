// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CircleAvatarWidget extends StatelessWidget {
  final String imagePath;

  const CircleAvatarWidget({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 40,
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
