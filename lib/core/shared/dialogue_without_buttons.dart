import 'package:flutter/material.dart';
import 'package:get/get.dart';

void dialogueWithoutButtons(
    {required String title, required String middleText}) {
  Get.dialog(
    Center(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          width: Get.width * 0.7, // Responsive width
          height: Get.height * 0.2, // Responsive height
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
                    fontSize: 102.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    decoration: TextDecoration.none, // Ensure no decoration
                    // Title text color
                  ),
                ),
              ),
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
