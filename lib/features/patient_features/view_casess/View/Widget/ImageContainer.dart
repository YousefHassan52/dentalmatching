// ignore_for_file: unused_import, file_names

import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/features/patient_features/view_casess/data/Model/ImageModel.dart';
import 'package:dentalmatching/features/patient_features/view_casess/View/Widget/ImageContainerWidget.dart';
import 'package:dentalmatching/features/patient_features/view_casess/data/Model/case_model.dart';
import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    Key? key,
    required this.imagesList,
  }) : super(key: key);
  final List<String> imagesList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        itemCount: imagesList.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return ImageContainerWidget(
            image: imagesList[index],
          );
        },
      ),
    );
  }
}
