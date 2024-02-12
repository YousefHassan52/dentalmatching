// ignore_for_file: unused_import, file_names

import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/features/patient_features/View_Cases/data/Model/ImageModel.dart';
import 'package:dentalmatching/features/patient_features/View_Cases/View/Widget/ImageContainerWidget.dart';
import 'package:dentalmatching/features/patient_features/View_Cases/data/Model/case_model.dart';
import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final List<ImageModel> image = [
    ImageModel(image: 'assets/images/signup.png'),
    ImageModel(image: 'assets/images/signup.png'),
    ImageModel(image: 'assets/images/signup.png'),
    ImageModel(image: 'assets/images/signup.png'),
    ImageModel(image: 'assets/images/signup.png'),
    ImageModel(image: 'assets/images/signup.png'),
    ImageModel(image: 'assets/images/signup.png'),
  ];
  ImageContainer({
    Key? key,
    required this.caseModel,
  }) : super(key: key);
  final MyCaseModel caseModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        itemCount: caseModel.mouthImages.length,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ImageContainerWidget(
            image: caseModel.mouthImages[index],
          );
        },
      ),
    );
  }
}
