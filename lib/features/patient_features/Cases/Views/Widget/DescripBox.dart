
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:flutter/material.dart';

class DescripBox extends StatelessWidget {
  const DescripBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style:Styles.boxText,
      maxLines: null, 
      decoration: InputDecoration(
        filled: true,
        fillColor: Color.fromARGB(121, 148, 182, 236),
        hintText: 'Type here...',
        border: OutlineInputBorder(
          //borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: AppColors
                  .blueLightTextColor), // Set the border color
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
