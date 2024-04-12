import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/core/functions/validator.dart';
import 'package:dentalmatching/features/common_faetures/forget_password/reset_password/controller/reset_password_controller_imp.dart';
import 'package:dentalmatching/features/common_faetures/loginn/view/widgets/auth_button.dart';
import 'package:dentalmatching/features/common_faetures/loginn/view/widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp externalController =
        Get.put(ResetPasswordControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            icon: SvgPicture.asset("assets/svg/double_back_button.svg"),
            onPressed: () {
              Get.back();
            }),
        title:  Text(
          "Reset Password".tr,
          style: Styles.mediumTitle,
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Form(
            key: externalController.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/svg/reset_password.svg",
                  height: Get.height * 0.3,
                ),
                const SizedBox(
                  height: 20,
                ),
                 Text(
                  "Please Enter Your New Password".tr,
                  style: Styles.textStyle16LightBlue,
                  textAlign: TextAlign.center,
                ),
                // GetBuilder<ResetPasswordControllerImp>(
                //     builder: (internalController) => AuthTextFormField(
                //           validator: (value) {
                //             return AppValidator.textFormFieldValidator(
                //                 value!, "password");
                //           },
                //           text: "Password",
                //           icon: IconButton(
                //             onPressed: () {
                //               internalController.changePasswordVisibility();
                //             },
                //             icon: internalController.passwordOneVisibility ==
                //                     false
                //                 ? const Icon(Icons.remove_red_eye)
                //                 : const Icon(Icons.visibility_off),
                //           ),
                //           fieldController: internalController.firstPassword,
                //           keyboardType: TextInputType.visiblePassword,
                //           isPassword: !internalController.passwordOneVisibility,
                //         )),
                GetBuilder<ResetPasswordControllerImp>(
                  builder: (internalController) => Column(
                    children: [
                      AuthTextFormField(
                        isPassword: internalController.passwordOneVisibility,
                        hint: "Password".tr,
                        icon: "assets/svg/unlock.svg",
                        type: TextInputType.visiblePassword,
                        validator: (value) {
                          return AppValidator.textFormFieldValidator(
                              value!, "password");
                        },
                        fieldController:
                            internalController.firstPasswordController,
                        icon2: IconButton(
                          onPressed: () {
                            internalController.changePasswordVisibility();
                          },
                          icon: internalController.passwordOneVisibility
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
                      AuthTextFormField(
                        isPassword: internalController.passwordTwoVisibility,
                        hint: "Confirm Password".tr,
                        icon: "assets/svg/unlock.svg",
                        type: TextInputType.visiblePassword,
                        validator: (value) {
                          return AppValidator.chechkPasswordMatching(value,
                              internalController.firstPasswordController.text);
                        },
                        fieldController:
                            internalController.secondPasswordController,
                        icon2: IconButton(
                          onPressed: () {
                            internalController.changePasswordVisibility(
                                secondPass: true);
                          },
                          icon: internalController.passwordTwoVisibility
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
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                AuthButton(
                    buttonText: "Confirm".tr,
                    onTap: () {
                      externalController.resetPassword();
                    }),
                const SizedBox(
                  height: 20,
                ),
                GetBuilder<ResetPasswordControllerImp>(
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
          ),
        ),
      ),
    );
  }
}
