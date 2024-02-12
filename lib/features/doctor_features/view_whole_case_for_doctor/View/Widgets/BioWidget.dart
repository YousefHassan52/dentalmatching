import 'package:dentalmatching/core/constants/styles.dart';
import 'package:flutter/material.dart';

class BioWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  bool isLongText;
  BioWidget({
    super.key,
    required this.title,
    required this.subTitle,
    this.isLongText = false,
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
          style: isLongText == true
              ? Styles.Bio.copyWith(fontSize: 14)
              : Styles.Bio,
        ),
      ],
    );
  }
}
