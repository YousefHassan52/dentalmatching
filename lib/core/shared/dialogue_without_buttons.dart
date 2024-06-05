import 'package:flutter/material.dart';
import 'package:get/get.dart';

void customDialoge(
    {required String title,
    required String middleText,
    Color textColor = Colors.black,
    Color backgroundColor = Colors.white}) {
  Get.dialog(
    Center(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          width: Get.width * 0.7, // Responsive width
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0), // Border radius
            color: backgroundColor, // Dialog background color
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                    decoration: TextDecoration.none, // Ensure no decoration
                    // Title text color
                  ),
                ),
              ),
              const SizedBox(height: 10), // Space between title and middle text
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  middleText,
                  style: TextStyle(
                    decoration: TextDecoration.none, // Ensure no decoration
                    fontSize: 16.0,
                    fontWeight: FontWeight.w300,
                    color: textColor, // Middle text color
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
