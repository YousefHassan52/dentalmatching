import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/core/functions/validator.dart';
import 'package:dentalmatching/features/common_faetures/forget_password/reset_password/controller/reset_password_controller_imp.dart';
import 'package:dentalmatching/features/common_faetures/login/view/widgets/auth_button.dart';
import 'package:dentalmatching/features/common_faetures/login/view/widgets/textformfield.dart';
import 'package:dentalmatching/features/common_faetures/login/view/widgets/welcome_text.dart';
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
                  "Reset Password",
                  style: Styles.textStyle16,
                ),
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: const AuthWelcomeText(
                      welcomeText: "Now you could reset your password ",
                    )),
                GetBuilder<ResetPasswordControllerImp>(
                    builder: (internalController) => AuthTextFormField(
                          validator: (value) {
                            return AppValidator.textFormFieldValidator(
                                value!, "password");
                          },
                          text: "Password",
                          icon: IconButton(
                            onPressed: () {
                              internalController.changePasswordVisibility();
                            },
                            icon: internalController.passwordOneVisibility ==
                                    false
                                ? const Icon(Icons.remove_red_eye)
                                : const Icon(Icons.visibility_off),
                          ),
                          fieldController: internalController.firstPassword,
                          keyboardType: TextInputType.visiblePassword,
                          isPassword: !internalController.passwordOneVisibility,
                        )),
                AuthButton(
                    buttonText: "Save",
                    onTap: () {
                      externalController.resetPassword();
                    }),
                GetBuilder<ResetPasswordControllerImp>(
                  init: ResetPasswordControllerImp(),
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
      ),
    );
  }
}
