import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/features/patient_features/Cases/Views/Widget/Check.dart';
import 'package:dentalmatching/features/patient_features/Cases/Views/Widget/DescripBox.dart';
import 'package:dentalmatching/features/patient_features/Cases/Views/Widget/FormHeadLine.dart';
import 'package:dentalmatching/features/patient_features/Cases/Views/Widget/HDivider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormContainer extends StatelessWidget {
  const FormContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
        width: Get.width * 0.93,
        height: 600,
        decoration: BoxDecoration(
          color: const Color.fromARGB(77, 207, 216, 220),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color(0xff4A6BAD),
          ),

          // boxShadow: [
          //   BoxShadow(
          //     color: AppColors.blueLightTextColor.withOpacity(0.2),
          //     spreadRadius: 1,
          //     blurRadius: 3,
          //   ),
          // ],
        ),
        child:  Column(
          children: [
            const FormHeadLine(headline: 'Describe what you feel'),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: DescripBox(),
            ),
            const HDivider(),
            const FormHeadLine(headline: 'Chronic Diseases'),
            ChronicDiseasesChecklist(),
            const HDivider(),
           const FormHeadLine(headline: 'Add a Clear Pictures of your Mouth')
          
          ],
        ),
      ),
    );
  }
}
