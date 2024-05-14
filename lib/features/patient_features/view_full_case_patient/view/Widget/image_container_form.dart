import 'package:dentalmatching/features/patient_features/view_full_case_patient/view/Widget/instant_img_form.dart';
import 'package:flutter/material.dart';

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
