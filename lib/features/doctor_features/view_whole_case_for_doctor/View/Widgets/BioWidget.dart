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
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              '${title} : ',
              style: Styles.Bio,
            ),
          ),
        ),
        Flexible(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              subTitle,
              style: isLongText == true ? Styles.Bio : Styles.Bio,
            ),
          ),
        ),
      ],
    );
  }
}
