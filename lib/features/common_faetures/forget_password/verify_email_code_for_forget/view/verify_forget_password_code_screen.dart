// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings

import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/features/common_faetures/forget_password/verify_email_code_for_forget/controller/verify_forget_password_code_controller_imp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class VerifyForgetPasswordCodeScreen extends StatelessWidget {
  const VerifyForgetPasswordCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VerifyEmailForgetPasswordCodeControllerImp externalController =
        Get.put(VerifyEmailForgetPasswordCodeControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            icon: SvgPicture.asset("assets/svg/double_back_button.svg"),
            onPressed: () {
              Get.back();
            }),
        title:  FittedBox(
          child: Text(
            "Verify Your Email".tr,
            style: Styles.mediumTitle,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/svg/verify_email.svg",
                height: Get.height * 0.3,
              ),
              const SizedBox(
                height: 20,
              ),
               Text(
                "Please enter the code sent to ".tr,
                style: Styles.textStyle16LightBlue,
              ),
              Text(
                externalController.email,
                style: Styles.textStyle16,
              ),
              const SizedBox(height: 20),
              OTPTextField(
                  controller: externalController.verifyCodeController,
                  length: 5,
                  width: Get.width,
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldWidth: 45,
                  fieldStyle: FieldStyle.box,
                  outlineBorderRadius: 15,
                  style: const TextStyle(fontSize: 17),
                  onChanged: (pin) {
                    print("Changed: " + pin);
                  },
                  onCompleted: (pin) {
                    externalController.checkForgetPasswordCode(code: pin);
                  }),
              GetBuilder<VerifyEmailForgetPasswordCodeControllerImp>(
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
    );
  }
}
