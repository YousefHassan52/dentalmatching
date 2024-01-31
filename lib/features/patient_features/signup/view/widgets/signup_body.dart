import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/functions/validator.dart';
import 'package:dentalmatching/features/common_faetures/loginn/view/widgets/auth_button.dart';
import 'package:dentalmatching/features/common_faetures/loginn/view/widgets/textformfield.dart';
import 'package:dentalmatching/features/patient_features/signup/controller/signup_controller_impl.dart';
import 'package:dentalmatching/features/patient_features/signup/view/widgets/gender_field.dart';
import 'package:dentalmatching/features/patient_features/signup/view/widgets/gov_dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

// youm ma te3tal raga3 el body fe SignupScreen we 2e4ta8al 3ady
class SignupFormBody extends StatelessWidget {
  const SignupFormBody({
    super.key,
    // required this.externalController,
  });

  // final SignupControllerImpl externalController;

  @override
  Widget build(BuildContext context) {
    SignupControllerImpl externalController = Get.find();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          AuthTextFormField(
              hint: "First Name",
              icon: "assets/svg/first_name.svg",
              type: TextInputType.name,
              validator: (value) {
                return AppValidator.textFormFieldValidator(value!, "username");
              },
              fieldController: externalController.firstNameController),
          const SizedBox(
            height: 15,
          ),
          AuthTextFormField(
              hint: "Last Name",
              icon: "assets/svg/first_name.svg",
              type: TextInputType.name,
              validator: (value) {
                return AppValidator.textFormFieldValidator(value!, "username");
              },
              fieldController: externalController.lastNameController),
          const SizedBox(
            height: 15,
          ),
          GovernmentDropdownSearch(externalController: externalController),
          const SizedBox(
            height: 15,
          ),
          GenderDropdown(externalController: externalController),
          const SizedBox(
            height: 15,
          ),

          // phone----------------------------
          AuthTextFormField(
              hint: "Phone",
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
              hint: "Email Address",
              icon: "assets/svg/email.svg",
              type: TextInputType.name,
              validator: (value) {
                return AppValidator.textFormFieldValidator(value!, "email");
              },
              fieldController: externalController.emailController),
          // password----------------------------------
          const SizedBox(
            height: 15,
          ),
          GetBuilder<SignupControllerImpl>(
            builder: (controller) => AuthTextFormField(
              hint: "Password",
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
              buttonText: "Signup",
              onTap: () {
                externalController.signup();
              }),
        ],
      ),
    );
  }
}
