
import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  final String text;
  const Heading({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 120),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Color(0xFF1E496B),
            fontSize: 45,
            //fontFamily: 'Commissioner',
            fontWeight: FontWeight.w800,
            height: 0.09,
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }
}