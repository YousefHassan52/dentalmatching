import 'package:dentalmatching/features/patient_features/signup/controller/signup_controller_impl.dart';
import 'package:dentalmatching/features/patient_features/signup/view/widgets/signup_body.dart';
import 'package:dentalmatching/features/patient_features/signup/view/widgets/upper_signup-widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignupControllerImpl externalController = Get.put(SignupControllerImpl());
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Form(
        key: externalController.formKey,
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            UpperSignupWidget(),
            SizedBox(
              height: 30,
            ),
            SignupFormBody(),
          ],
        ),
      ),
    );
  }
}
