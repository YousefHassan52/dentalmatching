import 'package:dentalmatching/core/constants/colors.dart';
import 'package:flutter/material.dart';

class GoToLoginOrSignupRow extends StatelessWidget {
  const GoToLoginOrSignupRow({
    super.key,
    required this.buttonFunction,
    required this.login,
  });

  final void Function() buttonFunction;
  final bool login;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        login == true
            ? const Text("don't hava an account..?")
            : const Text("Already hava an account..?"),
        TextButton(
            onPressed: buttonFunction,
            child: login == true
                ? const Text(
                    "Sign up",
                    style: TextStyle(color: AppColors.mainColor),
                  )
                : const Text("Login",
                    style: TextStyle(color: AppColors.mainColor))),
      ],
    );
  }
}
