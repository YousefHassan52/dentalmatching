import 'package:dentalmatching/core/constants/styles.dart';
import 'package:flutter/material.dart';

class OptionalText extends StatelessWidget {
  final String text;
  const OptionalText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        RichText(
          text: TextSpan(
            text: text,
            style: Styles.formTitle,
            children: const [
              TextSpan(
                text: ' (Optional)',
                style: Styles.textStyle16Grey,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 6,
        ),
      ],
    );
  }
}
