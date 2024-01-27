import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/core/functions/validator.dart';
import 'package:dentalmatching/features/common_faetures/forget_password/check_email/controller/check_email_forget_password_controller_imp.dart';
import 'package:dentalmatching/features/common_faetures/login/view/widgets/auth_button.dart';
import 'package:dentalmatching/features/common_faetures/login/view/widgets/textformfield.dart';
import 'package:dentalmatching/features/common_faetures/login/view/widgets/welcome_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CheckEmailForForgetPasswordScreen extends StatelessWidget {
  const CheckEmailForForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CheckEmailForForgetPasswordControllerImp externalController =
        Get.put(CheckEmailForForgetPasswordControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
                ClipOval(
                    child: CircleAvatar(
                        radius: 50,
                        child: SvgPicture.asset("assets/svg/save_money.svg"))),
                const Text(
                  "Forget Password !!",
                  style: Styles.textStyle16,
                ),
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: const AuthWelcomeText(
                      welcomeText:
                          "Write your Email and we will send to you a verification code",
                    )),
                AuthTextFormField(
                  validator: (value) {
                    return AppValidator.textFormFieldValidator(value!, "email");
                  },
                  text: "Email",
                  icon: Icon(Icons.email_rounded),
                  fieldController: externalController.emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                AuthButton(
                    buttonText: "Check",
                    onTap: () {
                      externalController.checkEmail();
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
