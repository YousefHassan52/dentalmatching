import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextForm extends StatelessWidget {
  final String hint;
  final IconData icon;
  final IconData? icon2;
  final TextInputType? type;
  final bool password;

  const TextForm({
    super.key,
    required this.hint,
    required this.icon,
    this.type,
    required this.password,
    this.icon2,
  });

  @override
  Widget build(BuildContext context) {
    //double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05 , vertical: Get.width * 0.02),
      child: Form(
        child: TextFormField(
          obscureText: password,
          cursorColor: const Color(0xFF4464A0),
          keyboardType: type,
          style: TextStyle(
            color: const Color(0xFF4464A0),
            fontWeight: FontWeight.bold,
            fontSize: Get.width * 0.04,
          ),
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: const Color.fromARGB(224, 94, 148, 195),
              size: Get.width * 0.08,
            ),
            suffixIcon: icon2 != null
                ? Icon(
                    icon2,
                    color: const Color.fromARGB(224, 94, 148, 195),
                    size: Get.width * 0.08,
                  )
                : null,
            hintText: hint,
            hintStyle: TextStyle(
              color: const Color.fromARGB(100, 94, 148, 195),
              fontSize: Get.width * 0.04,
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(width: 3, color: Color(0xFFCBE1F8)),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(width: 3.5, color: Color(0xFF4464A0)),
            ),
          ),
        ),
      ),
    );
  }
}
