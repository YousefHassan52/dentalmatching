// ignore: unused_import
// ignore_for_file: file_names

import 'package:dentalmatching/features/patient_features/view_full_case_patient/view/Widget/instant_img_form.dart';
import 'package:flutter/material.dart';

class ImageContainerWidget extends StatelessWidget {
  final String image;
  const ImageContainerWidget({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InstantImageForm(img: image),
        ),
      ],
    );

  }
}
