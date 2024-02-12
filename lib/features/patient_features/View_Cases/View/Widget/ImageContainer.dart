import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/features/patient_features/View_Cases/data/Model/ImageModel.dart';
import 'package:dentalmatching/features/patient_features/View_Cases/View/Widget/ImageContainerWidget.dart';
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ImageContainerWidget(
            model: image[index],
          );
        },
      ),
    );
  }
}
