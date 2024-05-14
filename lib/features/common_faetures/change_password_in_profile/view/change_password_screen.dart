import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/functions/validator.dart';
import 'package:dentalmatching/features/common_faetures/change_password_in_profile/controller/change_password_controller_impl.dart';
import 'package:dentalmatching/features/common_faetures/forget_password/check_email/view/check_email_from_settings.dart';
import 'package:dentalmatching/features/common_faetures/loginn/view/widgets/auth_button.dart';
import 'package:dentalmatching/features/common_faetures/loginn/view/widgets/textformfield.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/view/Widgets/upper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ChangePasswordControllerImpl());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            UpperWidget(
              needBackButton: true,
              text: 'Change Password'.tr,
              welcome: false,
            ),
            GetBuilder<ChangePasswordControllerImpl>(builder: (controller) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        AuthTextFormField(
                          hint: "Current Password",
                          icon: "assets/svg/unlock.svg",
                          type: TextInputType.visiblePassword,
                          validator: (value) {
                            return AppValidator.textFormFieldValidator(
                                value!, "password");
                          },
                          fieldController: controller.currentPasswordController,
                          isPassword: controller.currentPasswordnotVisible,
                          icon2: IconButton(
                            onPressed: () {
                              controller.changeCurrentPasswordVisibility();
                            },
                            icon: controller.currentPasswordnotVisible == true
                                ? const Icon(
                                    Icons.remove_red_eye,
                                    color: AppColors.secondColor,
                                  )
                                : const Icon(
                                    Icons.visibility_off,
                                    color: AppColors.secondColor,
                                  ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        AuthTextFormField(
                          isPassword: controller.newPasswordnotVisible,
                          hint: "New Password",
                          icon: "assets/svg/unlock.svg",
                          type: TextInputType.visiblePassword,
                          validator: (value) {
                            return AppValidator.textFormFieldValidator(
                                value!, "password");
                          },
                          fieldController: controller.newPasswordController,
                          icon2: IconButton(
                            onPressed: () {
                              controller.changeNewPasswordVisibility();
                            },
                            icon: controller.newPasswordnotVisible == true
                                ? const Icon(
                                    Icons.remove_red_eye,
                                    color: AppColors.secondColor,
                                  )
                                : const Icon(
                                    Icons.visibility_off,
                                    color: AppColors.secondColor,
                                  ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AuthButton(
                            buttonText: "Submit",
                            onTap: () {
                              controller.changePassword();
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Flexible(
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  "forget old password?",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 118, 119, 120),
                                      fontSize: 16),
                                ),
                              ),
                            ),
                            Flexible(
                              child: TextButton(
                                onPressed: () {
                                  Get.to(CheckEmailFromSettings(
                                    email: controller.email,
                                  ));
                                  // Get.to(const CasesScreen());
                                },
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    "Press Here".tr,
                                    style: const TextStyle(
                                      color: AppColors.blueTextColor,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        if (controller.requestStatus == RequestStatus.LOADING)
                          LinearProgressIndicator(
                            color: AppColors.mainColor,
                            backgroundColor:
                                AppColors.mainColor.withOpacity(0.20),
                          )
                      ],
                    )),
              );
            })
          ],
        ),
      ),
    );
  }
}
