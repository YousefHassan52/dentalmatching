import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/core/functions/validator.dart';
import 'package:dentalmatching/features/common_faetures/loginn/view/widgets/auth_button.dart';
import 'package:dentalmatching/features/common_faetures/loginn/view/widgets/textformfield.dart';
import 'package:dentalmatching/features/patient_features/signup/controller/signup_controller_impl.dart';
import 'package:dentalmatching/features/patient_features/signup/data/static.dart';
import 'package:dentalmatching/features/patient_features/signup/view/widgets/upper_signup-widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignupControllerImpl externalController = Get.put(SignupControllerImpl());
    double upperPartHeight = Get.height * 0.2;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          UpperSignupWidget(upperPartHeight: upperPartHeight),
          const SizedBox(
            height: 30,
          ),
          AuthTextFormField(
              hint: "User Name",
              icon: "assets/svg/email.svg",
              type: TextInputType.name,
              validator: (value) {
                return AppValidator.textFormFieldValidator(value!, "username");
              },
              fieldController: externalController.userNameController),
        ],
      ),
    );
  }
}
