import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CircleAvatarWidget extends StatelessWidget {
  final String imagePath;
  final bool defaultImage;

  const CircleAvatarWidget({
    super.key,
    this.defaultImage = true,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 40,
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: defaultImage
            ? ClipOval(
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(48),
                  child: SvgPicture.asset(imagePath),
                ),
              )
            : Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
      ),
    );
  }
}
