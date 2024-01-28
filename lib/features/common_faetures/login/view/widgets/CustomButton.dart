import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: screenWidth * 0.1,
      width: screenWidth * 0.4,
      child: MaterialButton(
        disabledColor: const Color(0xFF1E496B),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(screenWidth * 0.05)),
        onPressed: onPressed,
        textColor: Colors.white,
        child: Text(
          text,
          style: TextStyle(fontSize: screenWidth * 0.05),
        ),
      ),
    );
  }
}
