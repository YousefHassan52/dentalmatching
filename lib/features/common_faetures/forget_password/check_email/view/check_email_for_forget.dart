import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/core/functions/validator.dart';
import 'package:dentalmatching/features/common_faetures/forget_password/check_email/controller/check_email_forget_password_controller_imp.dart';
import 'package:dentalmatching/features/common_faetures/loginn/view/widgets/auth_button.dart';
import 'package:dentalmatching/features/common_faetures/loginn/view/widgets/textformfield.dart';
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
        centerTitle: true,
        leading: IconButton(
            icon: SvgPicture.asset("assets/svg/double_back_button.svg"),
            onPressed: () {
              Get.back();
            }),
        title: const Text(
          "Forget Password",
          style: Styles.mediumTitle,
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: externalController.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/svg/check_email.svg",
                  height: Get.height * 0.3,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Please Enter Your Email Address To Receive A verification Code ",
                  style: Styles.textStyle16LightBlue,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 25,
                ),
                // AuthTextFormField(
                //   validator: (value) {
                //     return AppValidator.textFormFieldValidator(value!, "email");
                //   },
                //   text: "Email",
                //   icon: Icon(Icons.email_rounded),
                //   fieldController: externalController.emailController,
                //   keyboardType: TextInputType.emailAddress,
                // ),
                AuthTextFormField(
                    type: TextInputType.emailAddress,
                    hint: "Email Address",
                    icon: "assets/svg/email.svg",
                    validator: (value) {
                      return AppValidator.textFormFieldValidator(
                          value!, "email");
                    },
                    fieldController: externalController.emailController),
                const SizedBox(
                  height: 25,
                ),
                AuthButton(
                    buttonText: "Check",
                    onTap: () {
                      externalController.checkEmail();
                    }),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
