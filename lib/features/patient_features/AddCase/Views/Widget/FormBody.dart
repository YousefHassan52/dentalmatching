import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/functions/validator.dart';
import 'package:dentalmatching/features/common_faetures/loginn/view/widgets/auth_button.dart';
import 'package:dentalmatching/features/patient_features/AddCase/Controller/FormController.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dentalmatching/features/patient_features/AddCase/Views/Widget/AddImg.dart';
import 'package:dentalmatching/features/patient_features/AddCase/Views/Widget/AddOptionalImg.dart';
import 'package:dentalmatching/features/patient_features/AddCase/Views/Widget/Check.dart';
import 'package:dentalmatching/features/patient_features/AddCase/Views/Widget/DescripBox.dart';
import 'package:dentalmatching/features/patient_features/AddCase/Views/Widget/FormHeadLine.dart';
import 'package:dentalmatching/features/patient_features/AddCase/Views/Widget/HDivider.dart';
import 'package:dentalmatching/features/patient_features/AddCase/Views/Widget/KnownCheckWidget.dart';
import 'package:dentalmatching/features/patient_features/AddCase/Views/Widget/OptionalText.dart';
import 'package:dentalmatching/features/patient_features/View_Cases/Controller/mycases_patient_controller_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormBody extends StatelessWidget {
  const FormBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // StaticData list = StaticData();

    AddCaseController controller = Get.find();
    MyCasesPatientControllerImpl reloadController = Get.find();

    ScrollController scrollController = ScrollController();

    return SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            Form(
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
                      fieldController: controller.descriptionController,
                    ),
                  ),
                  const HDivider(),
                  const FormHeadLine(headline: 'Chronic Diseases'),
                  const ChronicDiseasesChecklist(),
                  // //MyForm(),
                  const HDivider(),
                  const FormHeadLine(
                      headline: 'Add a Clear Pictures of your Mouth'),
                  const SizedBox(
                    height: 9,
                  ),
                  AddImageWidget(
                    img: 'assets/svg/Bold_Img_load-box.svg',
                    txt: 'Upload Pictures',
                    onPressed: () {
                      controller.pickMouthImages();
                    },
                  ),
                  // const SizedBox(
                  //   height: 8,
                  // ),
                  // AddImageWidget(
                  //   img: 'assets/svg/Boldd_Camera.svg',
                  //   txt: 'Take Pictures',
                  //   onPressed: () {},
                  // ),
                  const OptionalText(
                    text: 'Add X-Ray',
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  AddOptionalImg(
                    img: 'assets/svg/Bold_Img_load-box.svg',
                    txt: 'Upload Picture',
                    onPressed: () {
                      controller.pickXrayImages();
                    },
                  ),
                  // const SizedBox(
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
                  const OptionalText(
                    text: 'Add Prescription',
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  AddOptionalImg(
                    img: 'assets/svg/Bold_Img_load-box.svg',
                    txt: 'Upload Picture',
                    onPressed: () {
                      controller.pickPrescriptionImages();
                    },
                  ),
                  // const SizedBox(
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
                  const FormHeadLine(headline: 'Do you know your case ?'),
                  const KnownCheckWidget(),
                  const SizedBox(
                    height: 8,
                  ),
                  // //CheckboxFormField(),
                  // AnimatedButton(
                  //   text: 'Success Dialog',
                  //   color: Colors.green,
                  //   pressEvent: () {
                  //     controller.postCase(context).then((value) {
                  //       // This block will execute after postCase() is completed
                  //       reloadController.getCases();
                  //       // Show AwesomeDialog here
                  //       AwesomeDialog(
                  //         context: context,
                  //         animType: AnimType.leftSlide,
                  //         headerAnimationLoop: false,
                  //         dialogType: DialogType.success,
                  //         showCloseIcon: true,
                  //         title: 'Success',
                  //         desc:
                  //             'Dialog description here..................................................',
                  //         btnOkOnPress: () {
                  //           debugPrint('OnClick');
                  //         },
                  //         btnOkIcon: Icons.check_circle,
                  //         onDismissCallback: (type) {
                  //           debugPrint('Dialog Dismissed from callback $type');
                  //         },
                  //       ).show();
                  //     });
                  //   },
                  // ),
                  AuthButton(
                    buttonText: 'Submit',
                    onTap: () {
                      controller.postCase(context).then((value) {
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
                              backgroundColor:
                                  AppColors.mainColor.withOpacity(0.20),
                            )
                          : null,
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
