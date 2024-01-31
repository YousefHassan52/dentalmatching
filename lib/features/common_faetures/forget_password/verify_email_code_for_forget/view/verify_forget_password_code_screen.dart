// ignore_for_file: avoid_print

import 'package:dentalmatching/core/class/request_status.dart';
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
    VerifyForgetPasswordCodeControllerImp externalController =
        Get.put(VerifyForgetPasswordCodeControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            icon: SvgPicture.asset("assets/svg/double_back_button.svg"),
            onPressed: () {
              Get.back();
            }),
        title: const Text(
          "Verify Your Email",
          style: Styles.mediumTitle,
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
              const Text(
                "Please Enter 5 Digits code Sent to",
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
              GetBuilder<VerifyForgetPasswordCodeControllerImp>(
                builder: (internalController) {
                  if (internalController.requestStatus ==
                      RequestStatus.LOADING) {
                    return const LinearProgressIndicator();
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
