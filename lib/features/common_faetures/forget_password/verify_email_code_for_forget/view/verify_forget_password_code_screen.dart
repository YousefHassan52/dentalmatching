import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/features/common_faetures/forget_password/verify_email_code_for_forget/controller/verify_forget_password_code_controller_imp.dart';
import 'package:dentalmatching/features/common_faetures/login/view/widgets/welcome_text.dart';
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
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipOval(
                  child: CircleAvatar(
                      radius: 50,
                      child: SvgPicture.asset("assets/svg/add.svg"))),
              const Text(
                "Verification Code",
                style: Styles.textStyle16,
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: const AuthWelcomeText(
                    welcomeText:
                        "Write the verification code that has been sent to \n y*******n@gmail.com",
                  )),
              OTPTextField(
                  controller: externalController.verifyCodeController,
                  length: 5,
                  width: MediaQuery.of(context).size.width,
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldWidth: 45,
                  fieldStyle: FieldStyle.box,
                  outlineBorderRadius: 15,
                  style: TextStyle(fontSize: 17),
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
