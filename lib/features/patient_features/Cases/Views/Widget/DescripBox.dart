
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/features/patient_features/Cases/Controller/ButtonController.dart';
import 'package:flutter/material.dart';

class DescripBox extends StatelessWidget {
   final String? Function(String?) validator;
 // final TextEditingController fieldController;
  
   const DescripBox({
    super.key, required this.validator
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //controller: fieldController,
      validator: validator,
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
