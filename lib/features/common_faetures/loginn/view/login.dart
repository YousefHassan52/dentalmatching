import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/functions/validator.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: externalController.formKey,
            child: Column(
              children: [
                const Heading(text: 'Welcome Back'),
                const CentImg(centeredImg: 'assets/svg/log.svg'),
                AuthTextFormField(
                    hint: "Phone",
                    icon: "assets/svg/Phone_icon.svg",
                    type: TextInputType.phone,
                    validator: (value) {
                      return AppValidator.textFormFieldValidator(
                          value!, "phone");
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
                Padding(
                  padding: const EdgeInsets.only(top: 10, right: 20),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
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
                ),
                const SizedBox(
                  height: 40,
                ),
                /* 
                // hajaaaaaaaaaaar 
                // 2esta3melt hena el auth button el 2na 3amlo ya hager 2orayeb lel 3amleno fe figma
                // 
                // */
                AuthButton(
                    buttonText: "Login",
                    onTap: () {
                      externalController.login();
                    }),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: Get.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account? ",
                        style: TextStyle(
                            color: Color.fromARGB(255, 118, 119, 120),
                            fontSize: 10),
                      ),
                      InkWell(
                        onTap: () {
                          // Get.offNamed(AppRoutes.userType);
                          externalController.goToSignupScreen();
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: AppColors.blueTextColor,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ],
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
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     //  LoginControllerImp externalController = Get.put(LoginControllerImp());
//     // TranslationController translationController =
//     //     Get.put(TranslationController());
//     return Scaffold(
//       appBar: AppBar(),
//       body: SafeArea(
//           child: Container(
//         width: double.infinity,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 Get.offAllNamed(AppRoutes.checkEmailForgetPassword);
//               },
//               child: const Text("Reset Password"),
//             ),
//             Row(
//               children: [
//                 ElevatedButton(
//                     onPressed: () {
//                       translationController.changeLang(langCode: "ar");
//                     },
//                     child: const Text("arabic")),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                     onPressed: () {
//                       translationController.changeLang(langCode: "en");
//                     },
//                     child: const Text(
//                       "english",
//                     )),
//               ],
//             ),
//             Text(
//               "1".tr,
//               style: TextStyle(
//                 fontSize: 36,
//                 fontWeight: FontWeight.w200,
//               ),
//             ),
//             Text(
//               "1".tr,
//               style: TextStyle(
//                 fontSize: 36,
//                 fontWeight: FontWeight.w300,
//               ),
//             ),
//             Text(
//               "1".tr,
//               style: TextStyle(
//                 fontSize: 36,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//             Text(
//               "1".tr,
//               style: TextStyle(
//                 fontSize: 36,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             Text(
//               "1".tr,
//               style: TextStyle(
//                 fontSize: 36,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             Text(
//               "1".tr,
//               style: TextStyle(
//                 fontSize: 36,
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//             Text(
//               "1".tr,
//               style: TextStyle(
//                 fontSize: 36,
//                 fontWeight: FontWeight.w800,
//               ),
//             ),
//             Text(
//               "1".tr,
//               style: TextStyle(
//                 fontSize: 36,
//                 fontWeight: FontWeight.w900,
//               ),
//             ),
//           ],
//         ),
//       )),
//     );
//   }