import 'package:flutter/material.dart';

class PreText extends StatelessWidget {
  final String text;

  const PreText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(top: screenWidth * 0.15),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: const Color(0xFF1E496B),
            fontSize: screenWidth * 0.08,
            fontWeight: FontWeight.w800,
            height: 1.2, 
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }
}
