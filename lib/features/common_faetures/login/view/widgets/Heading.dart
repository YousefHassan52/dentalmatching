import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Heading extends StatelessWidget {
  final String text;

  const Heading({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    

    return Padding(
      padding: EdgeInsets.only(top: Get.width * 0.15),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: const Color(0xFF1E496B),
            fontSize: Get.width * 0.08,
            fontWeight: FontWeight.w800,
            height: 1.2, 
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }
}
