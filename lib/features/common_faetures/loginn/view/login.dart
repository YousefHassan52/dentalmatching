import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/routes_names.dart';
import 'package:dentalmatching/core/functions/validator.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/features/common_faetures/loginn/controller/login_controller_impl.dart';

import 'package:dentalmatching/features/common_faetures/loginn/view/widgets/CentImg.dart';
import 'package:dentalmatching/features/common_faetures/loginn/view/widgets/Heading.dart';
import 'package:dentalmatching/features/common_faetures/loginn/view/widgets/auth_button.dart';
import 'package:dentalmatching/features/common_faetures/loginn/view/widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImp externalController = Get.put(LoginControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: externalController.formKey,
          child: ListView(
            padding: const EdgeInsets.only(top: 0),
            scrollDirection: Axis.vertical,
            children: [
              const FittedBox(
                  fit: BoxFit.fitWidth, child: Heading(text: 'Welcome Back')),
              const CentImg(centeredImg: 'assets/svg/log.svg'),
              AuthTextFormField(
                  hint: "Phone",
                  icon: "assets/svg/Phone_icon.svg",
                  type: TextInputType.phone,
                  validator: (value) {
                    return AppValidator.textFormFieldValidator(value!, "phone");
                  },
                  fieldController: externalController.phoneController),
              const SizedBox(
                height: 20,
              ),
              GetBuilder<LoginControllerImp>(
                builder: (controller) => AuthTextFormField(
                  hint: "Password",
                  icon: "assets/svg/unlock.svg",
                  type: TextInputType.visiblePassword,
                  validator: (value) {
                    return AppValidator.textFormFieldValidator(
                        value!, "password");
                  },
                  fieldController: controller.passwordController,
                  isPassword: externalController.notVisible,
                  icon2: IconButton(
                    onPressed: () {
                      controller.changePasswordVisibility();
                    },
                    icon: controller.notVisible == true
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
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    externalController.goToForgetPassword();
                  },
                  child: const Text(
                    'Forget Password?',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: AppColors.blueTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      decoration: TextDecoration.underline,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: AuthButton(
                    buttonText: "Login",
                    onTap: () {
                      externalController.login();
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Flexible(
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        "Don't have an account?",
                        style: TextStyle(
                            color: Color.fromARGB(255, 118, 119, 120),
                            fontSize: 16),
                      ),
                    ),
                  ),
                  Flexible(
                    child: TextButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.userType);
                        // Get.to(const CasesScreen());
                      },
                      child: const FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          "Signup",
                          style: TextStyle(
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
              GetBuilder<LoginControllerImp>(
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
