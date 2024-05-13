import 'package:dentalmatching/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MapLinkTextFormField extends StatelessWidget {
  final String? Function(String?) validator;
  final TextEditingController fieldController;

  final TextInputType type;

  const MapLinkTextFormField({
    super.key,
    required this.type,
    required this.validator,
    required this.fieldController,
  });

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;

    return TextFormField(
      controller: fieldController,
      validator: validator,
      cursorColor: AppColors.secondColor,
      keyboardType: type,
      style: const TextStyle(
        color: AppColors.userTextColor,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        hintText: "Write Hospital Name".tr,
        hintStyle: const TextStyle(
          color: Color.fromARGB(100, 94, 148, 195),
          fontSize: 16,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(width: 3, color: Color(0xFFCBE1F8)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(width: 3, color: AppColors.mainColor),
        ),
      ),
    );
  }
}
