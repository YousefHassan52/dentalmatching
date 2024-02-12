import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/features/patient_features/view_full_case_patient/view/Widget/InstantImgForm.dart';
import 'package:dentalmatching/features/patient_features/View_Cases/Data/Model/ImageModel.dart';
import 'package:flutter/material.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

class GridImage extends StatelessWidget {
  final String image;
  const GridImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return InstantImageForm(
      img: image,
    );
  }
}
