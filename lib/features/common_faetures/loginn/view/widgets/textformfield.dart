// ignore_for_file: deprecated_member_use

import 'package:dentalmatching/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthTextFormField extends StatelessWidget {
  final String? Function(String?) validator;
  final TextEditingController fieldController;
  final bool isPassword;

  final String hint;
  final String icon;
  final Widget? icon2;
  final TextInputType type;

  const AuthTextFormField({
    super.key,
    required this.hint,
    required this.icon,
    required this.type,
    this.isPassword = false,
    this.icon2,
    required this.validator,
    required this.fieldController,
  });

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;

    return TextFormField(
      controller: fieldController,
      validator: validator,
      obscureText: isPassword,
      cursorColor: AppColors.secondColor,
      keyboardType: type,
      style: const TextStyle(
        color: AppColors.userTextColor,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        prefixIcon: CustomSvgPicture(icon: icon),
        suffixIcon: icon2,
        hintText: hint,
        hintStyle: const TextStyle(
          color: Color.fromARGB(100, 94, 148, 195),
          fontSize: 16,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(width: 3, color: Color(0xFFCBE1F8)),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(width: 3, color: AppColors.secondColor),
        ),
      ),
    );
  }
}

class CustomSvgPicture extends StatelessWidget {
  const CustomSvgPicture({
    super.key,
    required this.icon,
  });

  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: SvgPicture.asset(
        height: 10,
        icon,
        color: const Color(0xFF67A4D3),
      ),
    );
  }
}
/*

Icon(
                icon2,
                color: const Color.fromARGB(224, 94, 148, 195),
                size: screenWidth * 0.08,
              )*/