import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BioWidgetDr extends StatelessWidget {
  final String title;
  final String subTitle;
  bool isLongText;
  Color textColor;
  BioWidgetDr(
      {super.key,
      required this.title,
      required this.subTitle,
      this.isLongText = false,
      this.textColor = Colors.white});

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
              '$title  ',
              style: TextStyle(
                  color: textColor, fontWeight: FontWeight.w300, fontSize: 24),
            ),
          ),
        ),
        Flexible(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              subTitle,
              style: isLongText == true
                  ? TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 24)
                  : TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 24),
            ),
          ),
        ),
      ],
    );
  }
}
