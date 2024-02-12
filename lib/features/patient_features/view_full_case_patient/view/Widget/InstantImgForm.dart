import 'package:dentalmatching/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

class InstantImageForm extends StatelessWidget {
  final String img;
  const InstantImageForm({
    super.key,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return InstaImageViewer(
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(
            width: 3,
            color: AppColors.mainColor,
          ),
          image: DecorationImage(
            image: NetworkImage(img),
            fit: BoxFit.cover,
          ),
          color: AppColors.mainColor,
          borderRadius: BorderRadius.all(Radius.circular(26)),
        ),
      ),
    );
  }
}
