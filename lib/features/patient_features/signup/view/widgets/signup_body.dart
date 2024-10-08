// ignore_for_file: body_might_complete_normally_nullable

import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/functions/validator.dart';
import 'package:dentalmatching/features/common_faetures/loginn/view/widgets/auth_button.dart';
import 'package:dentalmatching/features/common_faetures/loginn/view/widgets/textformfield.dart';
import 'package:dentalmatching/features/patient_features/signup/controller/signup_controller_impl.dart';
import 'package:dentalmatching/features/patient_features/signup/view/widgets/gender_field.dart';
import 'package:dentalmatching/features/patient_features/signup/view/widgets/gov_dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// youm ma te3tal raga3 el body fe SignupScreen we 2e4ta8al 3ady
class SignupFormBody extends StatelessWidget {
  const SignupFormBody({
    super.key,
    // required this.externalController,
  });

  // final SignupControllerImpl externalController;

  @override
  Widget build(BuildContext context) {
    SignupPatientControllerImpl externalController = Get.find();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          AuthTextFormField(
              hint: "Full Name".tr,
              icon: "assets/svg/first_name.svg",
              type: TextInputType.name,
              validator: (value) {
                return AppValidator.textFormFieldValidator(value!, "username");
              },
              fieldController: externalController.fullNameController),
          const SizedBox(
            height: 15,
          ),

          AuthTextFormField(
              hint: "Age".tr,
              icon: "assets/svg/age.svg",
              type: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "required";
                }
              },
              fieldController: externalController.ageController),
          const SizedBox(
            height: 15,
          ),
          const GovernmentDropdownSearch(),
          const SizedBox(
            height: 15,
          ),
          const GenderDropdown(),
          const SizedBox(
            height: 15,
          ),
          AuthTextFormField(
              hint: "Address".tr,
              icon: "assets/svg/Home.svg",
              type: TextInputType.name,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter your address";
                }
              },
              fieldController: externalController.addressController),
          const SizedBox(
            height: 15,
          ),
          // phone----------------------------
          AuthTextFormField(
              hint: "Phone".tr,
              icon: "assets/svg/phone.svg",
              type: TextInputType.phone,
              validator: (value) {
                return AppValidator.textFormFieldValidator(value!, "phone");
              },
              fieldController: externalController.phoneController),
          const SizedBox(
            height: 15,
          ),
          // email-------------------------------
          AuthTextFormField(
              hint: "Email Address".tr,
              icon: "assets/svg/email.svg",
              type: TextInputType.emailAddress,
              validator: (value) {
                return AppValidator.textFormFieldValidator(value!, "email");
              },
              fieldController: externalController.emailController),
          // password----------------------------------
          const SizedBox(
            height: 15,
          ),
          GetBuilder<SignupPatientControllerImpl>(
            builder: (controller) => AuthTextFormField(
              hint: "Password".tr,
              icon: "assets/svg/unlock.svg",
              type: TextInputType.visiblePassword,
              validator: (value) {
                return AppValidator.textFormFieldValidator(value!, "password");
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
            height: 30,
          ),
          AuthButton(
              buttonText: "Signup".tr,
              onTap: () {
                externalController.signup();
              }),
          GetBuilder<SignupPatientControllerImpl>(
            builder: (controller) => Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              child: controller.requestStatus == RequestStatus.LOADING
                  ? LinearProgressIndicator(
                      color: AppColors.mainColor,
                      backgroundColor: AppColors.mainColor.withOpacity(0.20),
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
