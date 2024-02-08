import 'package:dentalmatching/core/functions/validator.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/features/common_faetures/loginn/view/widgets/auth_button.dart';
import 'package:dentalmatching/features/patient_features/Cases/Controller/ButtonController.dart';
import 'package:dentalmatching/features/patient_features/Cases/Controller/KnownController.dart';
import 'package:dentalmatching/features/patient_features/Cases/Views/Widget/AddImg.dart';
import 'package:dentalmatching/features/patient_features/Cases/Views/Widget/AddOptionalImg.dart';
import 'package:dentalmatching/features/patient_features/Cases/Views/Widget/Check.dart';
import 'package:dentalmatching/features/patient_features/Cases/Views/Widget/DescripBox.dart';
import 'package:dentalmatching/features/patient_features/Cases/Views/Widget/FormBody.dart';
import 'package:dentalmatching/features/patient_features/Cases/Views/Widget/FormHeadLine.dart';
import 'package:dentalmatching/features/patient_features/Cases/Views/Widget/HDivider.dart';
import 'package:dentalmatching/features/patient_features/Cases/Views/Widget/KnownCheckWidget.dart';
import 'package:dentalmatching/features/patient_features/Cases/Views/Widget/OptionalText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormContainer extends GetView<MyServices> {
   
  const FormContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Expanded(
        child: Container(
          width: Get.width * 0.93,
          decoration: BoxDecoration(
            color: const Color.fromARGB(77, 207, 216, 220),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color(0xff4A6BAD),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 3, vertical: 15),
            child: const FormBody(),
          ),
        ),
      ),
    );
  }
}
