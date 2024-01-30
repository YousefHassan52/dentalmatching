import 'package:dentalmatching/core/constants/styles.dart';
import 'package:flutter/material.dart';

class AuthWelcomeText extends StatelessWidget {
  const AuthWelcomeText({
    super.key,
    required this.welcomeText,
  });
  final String welcomeText;

  @override
  Widget build(BuildContext context) {
    return Text(
      welcomeText,
      style: Styles.textStyle16,
      textAlign: TextAlign.center,
    );
  }
}
