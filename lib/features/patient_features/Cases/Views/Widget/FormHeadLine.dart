import 'package:dentalmatching/core/constants/styles.dart';
import 'package:flutter/material.dart';

class FormHeadLine extends StatelessWidget {
  final String headline;
  const FormHeadLine({
    super.key,
    required this.headline,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
      text:headline,
      style: Styles.formTitle,
    ));
  }
}
