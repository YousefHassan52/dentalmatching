import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/features/patient_features/Cases/Controller/FormController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RadioListWidget extends StatelessWidget {
  final ChronicDiseasesController controller = Get.put(ChronicDiseasesController());
 
  final List cont;
  final void Function(dynamic)? onChanged;
  final dynamic groupValue;
   RadioListWidget({super.key, required this.cont ,required this.onChanged, required this.groupValue});

  @override
  Widget build(BuildContext context) {
    
    return Column(
          children: [
            for (var iterator in cont)
              Column(
                children: [
                  RadioListTile(
                    activeColor: AppColors.mainColor,
                    title: Text(
                      iterator,
                      style: Styles.textStyle16Grey,
                    ),
                    value: iterator,
                    groupValue:groupValue ,
                    onChanged: onChanged
                  ),
                ],
              ),
          ],
        );
  }
}