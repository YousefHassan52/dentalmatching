import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/features/patient_features/View%20Form/view/Widget/InstantImgForm.dart';
import 'package:dentalmatching/features/patient_features/View_Cases/Data/Model/ImageModel.dart';
import 'package:flutter/material.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

class GridImage extends StatelessWidget {
  final ImageModel model;
  const GridImage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    
    return InstantImageForm(img: model.image,);
  }
}
