import 'package:flutter/material.dart';
import 'package:get/get.dart';

void customDialogeWithButtons({
  required String title,
  required String middleText,
  required VoidCallback confirm,
}) {
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
                  ),
                ),
              ),
              const SizedBox(height: 10), // Space between title and middle text
              Text(
                middleText,
                style: const TextStyle(
                  decoration: TextDecoration.none, // Ensure no decoration
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87, // Middle text color
                ),
              ),
              const SizedBox(
                  height: 20), // Space between middle text and buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.white, // Change color to red
                          ),
                        ),
                        onPressed: () {
                          Get.back(); // Close the dialog
                        },
                        child: const Text(
                          'Cancel',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Flexible(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.red, // Change color to red
                          ),
                        ),
                        onPressed: () {
                          confirm();
                        },
                        child: const Text(
                          'Confirm',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
