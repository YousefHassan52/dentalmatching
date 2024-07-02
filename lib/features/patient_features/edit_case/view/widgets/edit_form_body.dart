import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/routes_names.dart';
import 'package:dentalmatching/core/functions/validator.dart';
import 'package:dentalmatching/features/common_faetures/loginn/view/widgets/auth_button.dart';
import 'package:dentalmatching/features/patient_features/add_case/views/Widget/descrip_box.dart';
import 'package:dentalmatching/features/patient_features/add_case/views/Widget/form_headline.dart';
import 'package:dentalmatching/features/patient_features/add_case/views/Widget/divider.dart';
import 'package:dentalmatching/features/patient_features/add_case/views/Widget/optional_text.dart';
import 'package:dentalmatching/features/patient_features/edit_case/view/widgets/add_img_edit.dart';
import 'package:dentalmatching/features/patient_features/edit_case/view/widgets/add_optional_img_edit.dart';
import 'package:dentalmatching/features/patient_features/edit_case/view/widgets/add_pers_img._edit.dart';
import 'package:dentalmatching/features/patient_features/view_casess/Controller/mycases_patient_controller_impl.dart';
import 'package:dentalmatching/features/patient_features/edit_case/controller/editCaseController.dart';
import 'package:dentalmatching/features/patient_features/edit_case/view/widgets/edit_chronic_check_list.dart';
import 'package:dentalmatching/features/patient_features/edit_case/view/widgets/known_check_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditFormBody extends StatelessWidget {
  const EditFormBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // StaticData list = StaticData();

    EditCaseController controller = Get.find();
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
          const EditChronicDiseasesChecklist(),
          // //MyForm(),
          const HDivider(),
          FormHeadLine(headline: 'Add a Clear Pictures of your Mouth'.tr),
          const SizedBox(
            height: 9,
          ),
          AddImageEditWidget(
            img: 'assets/svg/Bold_Img_load-box.svg',
            txt: 'Upload Pictures'.tr,
            onPressed: () {
              controller.pickMouthImages();
            },
          ),
          OptionalText(
            text: 'Add X-Ray'.tr,
          ),
          const SizedBox(
            height: 9,
          ),
          AddOptionalImgEdit(
            img: 'assets/svg/Bold_Img_load-box.svg',
            txt: 'Upload Pictures'.tr,
            onPressed: () {
              controller.pickXrayImages();
            },
          ),
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
          AddPerscpEdit(
            img: 'assets/svg/Bold_Img_load-box.svg',
            txt: 'Upload Pictures'.tr,
            onPressed: () {
              Get.find<EditCaseController>().pickPrescriptionImages();
            },
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: HDivider(),
          ),
          FormHeadLine(headline: 'Do you know your case ?'.tr),
          const EditKnownCheckWidget(),
          const SizedBox(
            height: 8,
          ),
          // //CheckboxFormField(),
          AuthButton(
            buttonText: 'Update'.tr,
            onTap: () {
              controller.editCase().then((value) {
                reloadController.getCases();
                Get.offAllNamed(AppRoutes.homePatient);
              });
            },
          ),
          GetBuilder<EditCaseController>(
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
