import 'package:flutter/material.dart';

// ignore: must_be_immutable
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
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
                fontSize: 20
              ),
            ),
          ),
        ),
        Flexible(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              subTitle,
              style: isLongText == true ? const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 20
              ): const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 20
              ),
            ),
          ),
        ),
      ],
    );
  }
}
