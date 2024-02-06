import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/features/common_faetures/loginn/view/widgets/auth_button.dart';
import 'package:dentalmatching/features/patient_features/Cases/Controller/ButtonController.dart';
import 'package:dentalmatching/features/patient_features/Cases/Controller/KnownController.dart';
import 'package:dentalmatching/features/patient_features/Cases/Views/Widget/AddImg.dart';
import 'package:dentalmatching/features/patient_features/Cases/Views/Widget/AddOptionalImg.dart';
import 'package:dentalmatching/features/patient_features/Cases/Views/Widget/Check.dart';
import 'package:dentalmatching/features/patient_features/Cases/Views/Widget/DescripBox.dart';
import 'package:dentalmatching/features/patient_features/Cases/Views/Widget/FormHeadLine.dart';
import 'package:dentalmatching/features/patient_features/Cases/Views/Widget/HDivider.dart';
import 'package:dentalmatching/features/patient_features/Cases/Views/Widget/KnownCheckWidget.dart';
import 'package:dentalmatching/features/patient_features/Cases/Views/Widget/OptionalText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormContainer extends GetView<MyServices> {
  final NextButtonController button = Get.put(NextButtonController());
  FormContainer({
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 15),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const FormHeadLine(headline: 'Describe what you feel'),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: DescripBox(),
                  ),
                  const HDivider(),
                  const FormHeadLine(headline: 'Chronic Diseases'),
                  ChronicDiseasesChecklist(),
                  const HDivider(),
                  const FormHeadLine(
                      headline: 'Add a Clear Pictures of your Mouth'),
                  const SizedBox(
                    height: 9,
                  ),
                  AddImageWidget(
                    img: 'assets/svg/Bold_Img_load-box.svg',
                    txt: 'Upload Pictures',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  AddImageWidget(
                    img: 'assets/svg/Boldd_Camera.svg',
                    txt: 'Take Pictures',
                    onPressed: () {},
                  ),
                  const OptionalText(
                    text: 'Add X-Ray',
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  AddOptionalImg(
                    img: 'assets/svg/Bold_Img_load-box.svg',
                    txt: 'Upload Picture',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  AddOptionalImg(
                    img: 'assets/svg/Boldd_Camera.svg',
                    txt: 'Take Picture   ',
                    onPressed: () {},
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: HDivider(),
                  ),
                  const OptionalText(
                    text: 'Add Prescription',
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  AddOptionalImg(
                    img: 'assets/svg/Bold_Img_load-box.svg',
                    txt: 'Upload Picture',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  AddOptionalImg(
                    img: 'assets/svg/Boldd_Camera.svg',
                    txt: 'Take Picture   ',
                    onPressed: () {},
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: HDivider(),
                  ),
                  const FormHeadLine(headline: 'Do you know your case ?'),
                  KnownCheckWidget(),
                  const SizedBox(
                    height: 8,
                  ),
                  AuthButton(
                    buttonText: 'Next',
                    onTap: () {
                      button.handleButtonBehavior();
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
