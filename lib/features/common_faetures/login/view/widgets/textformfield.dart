import 'package:dentalmatching/core/constants/colors.dart';
import 'package:flutter/material.dart';

class AuthTextFormField extends StatelessWidget {
  const AuthTextFormField(
      {super.key,
      required this.text,
      required this.icon,
      this.isPassword = false,
      required this.fieldController,
      required this.keyboardType,
      required this.validator});
  final String text;
  final Widget icon;
  final bool isPassword;
  final TextEditingController fieldController;
  final TextInputType keyboardType;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        controller: fieldController,
        validator: validator,
        keyboardType: keyboardType,
        obscureText: isPassword,
        cursorColor: AppColors.blueTextColor,
        decoration: InputDecoration(
          suffixIcon: icon,
          suffixIconColor: AppColors.mainColor,
          label: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                text,
                style: const TextStyle(color: Colors.black),
              )),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(20)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}
