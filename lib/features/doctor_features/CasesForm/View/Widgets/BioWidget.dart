import 'package:dentalmatching/core/constants/styles.dart';
import 'package:flutter/material.dart';

class BioWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  const BioWidget({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${title} : ',
          style: Styles.Bio,
        ),
        Text(
          subTitle,
          style: Styles.Bio,
        ),
      ],
    );
  }
}
