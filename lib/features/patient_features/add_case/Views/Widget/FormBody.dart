import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/functions/validator.dart';
import 'package:dentalmatching/features/common_faetures/loginn/view/widgets/auth_button.dart';
import 'package:dentalmatching/features/patient_features/add_case/Controller/add_case_controller.dart';
import 'package:dentalmatching/features/patient_features/add_case/Views/Widget/AddImg.dart';
import 'package:dentalmatching/features/patient_features/add_case/Views/Widget/AddOptionalImg.dart';
import 'package:dentalmatching/features/patient_features/add_case/Views/Widget/Check.dart';
import 'package:dentalmatching/features/patient_features/add_case/Views/Widget/DescripBox.dart';
import 'package:dentalmatching/features/patient_features/add_case/Views/Widget/FormHeadLine.dart';
import 'package:dentalmatching/features/patient_features/add_case/Views/Widget/HDivider.dart';
import 'package:dentalmatching/features/patient_features/add_case/Views/Widget/KnownCheckWidget.dart';
import 'package:dentalmatching/features/patient_features/add_case/Views/Widget/OptionalText.dart';
import 'package:dentalmatching/features/patient_features/view_casess/Controller/mycases_patient_controller_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormBody extends StatelessWidget {
  FormBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // StaticData list = StaticData();

    AddCaseController controller = Get.find();
    MyCasesPatientControllerImpl reloadController = Get.find();

    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormHeadLine(headline: 'Describe what you feel'.tr),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DescripBox(
              validator: (value) {
                return AppValidator.textFormFieldValidator(
                    value!, "Description");
              },
              fieldController: controller.descriptionController,
            ),
          ),
          const HDivider(),
          FormHeadLine(headline: 'Chronic Diseases'.tr),
          const ChronicDiseasesChecklist(),
          // //MyForm(),
          const HDivider(),
          FormHeadLine(headline: 'Add a Clear Pictures of your Mouth'.tr),
          const SizedBox(
            height: 9,
          ),

          AddImageWidget(
            img: 'assets/svg/Bold_Img_load-box.svg',
            txt: 'Upload Pictures'.tr,
            onPressed: () {
              controller.pickMouthImages();
            },
          ),
          //  SizedBox(
          //   height: 8,
          // ),
          // AddImageWidget(
          //   img: 'assets/svg/Boldd_Camera.svg',
          //   txt: 'Take Pictures',
          //   onPressed: () {},
          // ),
          OptionalText(
            text: 'Add X-Ray'.tr,
          ),
          const SizedBox(
            height: 9,
          ),
          AddOptionalImg(
            img: 'assets/svg/Bold_Img_load-box.svg',
            txt: 'Upload Pictures'.tr,
            onPressed: () {
              controller.pickXrayImages();
            },
          ),
          //  SizedBox(
          //   height: 8,
          // ),
          // AddOptionalImg(
          //   img: 'assets/svg/Boldd_Camera.svg',
          //   txt: 'Take Picture   ',
          //   onPressed: () {},
          // ),
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: HDivider(),
          ),
          OptionalText(
            text: 'Add Prescription'.tr,
          ),
          const SizedBox(
            height: 9,
          ),
          AddOptionalImg(
            img: 'assets/svg/Bold_Img_load-box.svg',
            txt: 'Upload Pictures'.tr,
            onPressed: () {
              controller.pickPrescriptionImages();
            },
          ),
          //  SizedBox(
          //   height: 8,
          // ),
          // AddOptionalImg(
          //   img: 'assets/svg/Boldd_Camera.svg',
          //   txt: 'Take Picture   ',
          //   onPressed: () {},
          // ),
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: HDivider(),
          ),
          FormHeadLine(headline: 'Do you know your case ?'.tr),
          const KnownCheckWidget(),
          const SizedBox(
            height: 8,
          ),
          // //CheckboxFormField(),
          AuthButton(
            buttonText: 'Submit'.tr,
            onTap: () {
              controller.postCase().then((value) {
                reloadController.getCases();
              });
            },
          ),
          GetBuilder<AddCaseController>(
            builder: (controller) => Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              child: controller.requestStatus == RequestStatus.LOADING
                  ? LinearProgressIndicator(
                      color: AppColors.mainColor,
                      backgroundColor: AppColors.mainColor.withOpacity(0.20),
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
