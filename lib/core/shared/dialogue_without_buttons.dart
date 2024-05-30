import 'package:flutter/material.dart';
import 'package:get/get.dart';

void customDialoge({required String title, required String middleText}) {
  Get.dialog(
    Center(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          width: Get.width * 0.7, // Responsive width
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0), // Border radius
            color: Colors.white, // Dialog background color
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
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
                  style: const TextStyle(
                    decoration: TextDecoration.none, // Ensure no decoration
                    fontSize: 16.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.black87, // Middle text color
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
