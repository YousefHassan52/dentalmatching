import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/features/patient_features/View_Cases/data/Model/ImageModel.dart';
import 'package:flutter/material.dart';

class ImageContainerWidget extends StatelessWidget {
  final ImageModel model;
  const ImageContainerWidget({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: BorderRadius.all(Radius.circular(26)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Image.asset(model.image),
            ),
          ),
        ),
      ],
    );
    // Container(
    //   height: 130,
    //   child: ListView(
    //     scrollDirection: Axis.horizontal,
    //     children: List.generate(3, (i) {
    //       var image = images[i];
    //       return Container(
    //       height: 130,
    //       width: 130,
    //       decoration: const BoxDecoration(
    //         color: AppColors.mainColor,
    //         borderRadius: BorderRadius.all(Radius.circular(26)),
    //       ),
    //     );
    //     })
    //   ),
    // );
  }
}
