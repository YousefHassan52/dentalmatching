import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/features/common_faetures/loginn/view/widgets/auth_button.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/View/Widget/app_upper.dart';
import 'package:dentalmatching/features/doctor_features/edit_specialization/controller/impl_controller.dart';
import 'package:dentalmatching/features/doctor_features/edit_specialization/view/widgets/edit_specialization_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditSpecialization extends StatelessWidget {
  const EditSpecialization({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EditSpecializationControllerImpl externalController =
        Get.put(EditSpecializationControllerImpl());
    return Scaffold(
      body: Form(
        key: externalController.formKey,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            AppUpperWidget(
              text: 'Change Specialization   '.tr,
              needBackButton: true,
              welcome: false,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Choose your new specialization".tr,
                style: Styles.textStyle16,
                textAlign: TextAlign.start,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: EditDoctorSpecializationDropdownSearch(),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Add a photo to prove it : ".tr,
                style: Styles.textStyle16,
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(height: 20),
            GetBuilder<EditSpecializationControllerImpl>(builder: (controller) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    clipBehavior: Clip.antiAlias,
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                          width: MediaQuery.sizeOf(context).width * 0.7,
                          height: MediaQuery.sizeOf(context).width * 0.2,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              color: AppColors.blueTextColor,
                              borderRadius: BorderRadius.circular(30)),
                          child: controller.imageFile != null
                              ? Image.file(controller.imageFile!)
                              : const Icon(
                                  Icons.file_copy,
                                  size: 50,
                                  color: Colors.white,
                                )),
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 21,
                      ),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColors.mainColor,
                        child: IconButton(
                            onPressed: () {
                              controller.pickImage();
                            },
                            icon: const Icon(
                              Icons.camera_alt_rounded,
                              color: Colors.white,
                            )),
                      ),
                    ],
                  ),
                ],
              );
            }),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  text: '*'.tr,
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'PNG, JPG or JPEG'.tr,
                      style: Styles.textStyle16Grey,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            AuthButton(
                buttonText: "Submit".tr,
                onTap: () {
                  externalController.editSpecialization();
                }),
            GetBuilder<EditSpecializationControllerImpl>(
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
      ),
    );
  }
}
