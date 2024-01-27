import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  final String hint;
  final IconData icon;
  final TextInputType? type;
  final bool password;

  const TextForm(
      {super.key,
      required this.hint,
      required this.icon,
      this.type,
      required this.password});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:15),
      child: Form(
        child: TextFormField(
            obscureText: password,
            cursorColor: const Color(0xFF4464A0),
            keyboardType: type,
            style: const TextStyle(
              color: Color(0xFF4464A0),
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
            decoration: InputDecoration(
              prefixIcon: Icon(
                icon,
                color: const Color.fromARGB(224, 94, 148, 195),
                size: 30,
              ),
              hintText: hint,
              hintStyle: const TextStyle(
                  color: Color.fromARGB(100, 94, 148, 195), fontSize: 20),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(width: 3, color: Color(0xFFCBE1F8)),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(width: 3.5, color: Color(0xFF4464A0)),
              ),
            )),
      ),
    );
  }
}
