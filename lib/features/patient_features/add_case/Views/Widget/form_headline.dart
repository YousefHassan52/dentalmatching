import 'package:dentalmatching/core/constants/styles.dart';
import 'package:flutter/material.dart';

class FormHeadLine extends StatelessWidget {
  final String headline;

  const FormHeadLine({
    Key? key,
    required this.headline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
      text: headline,
      style: Styles.formTitle,
    ));
  }
}
