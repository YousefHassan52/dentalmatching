import 'package:dentalmatching/core/functions/validator.dart';
import 'package:dentalmatching/features/common_faetures/loginn/view/widgets/auth_button.dart';
import 'package:dentalmatching/features/patient_features/Cases/Controller/ButtonController.dart';
import 'package:dentalmatching/features/patient_features/Cases/Controller/FormController.dart';
import 'package:dentalmatching/features/patient_features/Cases/Views/Widget/AddImg.dart';
import 'package:dentalmatching/features/patient_features/Cases/Views/Widget/AddOptionalImg.dart';
import 'package:dentalmatching/features/patient_features/Cases/Views/Widget/Check.dart';
import 'package:dentalmatching/features/patient_features/Cases/Views/Widget/DescripBox.dart';
import 'package:dentalmatching/features/patient_features/Cases/Views/Widget/FormHeadLine.dart';
import 'package:dentalmatching/features/patient_features/Cases/Views/Widget/HDivider.dart';
import 'package:dentalmatching/features/patient_features/Cases/Views/Widget/KnownCheckWidget.dart';
import 'package:dentalmatching/features/patient_features/Cases/Views/Widget/OptionalText.dart';
import 'package:dentalmatching/features/patient_features/Cases/data/staticData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormBody extends StatelessWidget {
   const FormBody({
    super.key,
  });

   

  @override
  Widget build(BuildContext context) {
    StaticData list = StaticData();
      final ChronicDiseasesController controller =
      Get.put(ChronicDiseasesController());
      
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FormHeadLine(headline: 'Describe what you feel'),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DescripBox(
              validator: (value) {
                return AppValidator.textFormFieldValidator(
                    value!, "Description");
              },
              //fieldController: button.descriptionController,
            ),
          ),
          const HDivider(),
          const FormHeadLine(headline: 'Chronic Diseases'),
          ChronicDiseasesChecklist(),
          //MyForm(),
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
          //CheckboxFormField(),
          AuthButton(
            buttonText: 'Next',
            onTap: () {
              controller.handleButtonBehavior();
            },
          )
        ],
      ),
    );
  }
}
