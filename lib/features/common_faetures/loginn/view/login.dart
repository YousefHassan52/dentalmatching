import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/routes_names.dart';
import 'package:dentalmatching/core/functions/validator.dart';
import 'package:dentalmatching/features/common_faetures/loginn/controller/login_controller_impl.dart';

import 'package:dentalmatching/features/common_faetures/loginn/view/widgets/CentImg.dart';
import 'package:dentalmatching/features/common_faetures/loginn/view/widgets/Heading.dart';
import 'package:dentalmatching/features/common_faetures/loginn/view/widgets/auth_button.dart';
import 'package:dentalmatching/features/common_faetures/loginn/view/widgets/textformfield.dart';
import 'package:dentalmatching/features/patient_features/AddCase/Views/Cases.dart';
import 'package:dentalmatching/features/patient_features/PatientProfile/Views/PatientProfile.dart';
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
            scrollDirection: Axis.vertical,
            children: [
              IconButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.unassignedCasesDoctor);
                  },
                  icon: const Icon(
                    Icons.dangerous,
                    color: Colors.black,
                  )),
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
                  const FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      "Don't have an account?",
                      style: TextStyle(
                          color: Color.fromARGB(255, 118, 119, 120),
                          fontSize: 13),
                    ),
                  ),
                  // const Spacer(),
                  TextButton(
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
                            fontSize: 13,
                          ),
                        ),
                      ))
                ],
              ),
              // TextButton(
              //   onPressed: () {
              //     // Get.offNamed(AppRoutes.userType);
              //     //         //externalController.goToSignupScreen();
              //     //         // externalController.goToPreSignupScreen();
              //     Get.to(CasesScreen());
              //   },
              //   child: RichText(
              //     text: const TextSpan(
              //       text: "Don't have and account?",
              //       style: TextStyle(
              //           color: Color.fromARGB(255, 118, 119, 120),
              //           fontSize: 20),
              //       //style: Styles.formTitle,
              //       children: [
              //         TextSpan(
              //           text: ' Sign up.',
              //           style: TextStyle(
              //             color: AppColors.blueTextColor,
              //             fontWeight: FontWeight.bold,
              //             // decoration: TextDecoration.underline,
              //             fontSize: 20,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     const Text(
              //       "Don't have an account? ",
              //       style: TextStyle(
              //           color: Color.fromARGB(255, 118, 119, 120),
              //           fontSize: 13),
              //     ),
              //     InkWell(
              //       onTap: () {
              //         // Get.offNamed(AppRoutes.userType);
              //         //externalController.goToSignupScreen();
              //         // externalController.goToPreSignupScreen();
              //         Get.to(CasesScreen());
              //       },
              //       child: const Text(
              //         'Sign Up',
              //         style: TextStyle(
              //           color: AppColors.blueTextColor,
              //           fontWeight: FontWeight.bold,
              //           decoration: TextDecoration.underline,
              //           fontSize: 13,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
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