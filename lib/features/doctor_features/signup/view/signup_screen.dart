import 'package:dentalmatching/features/doctor_features/signup/controller/signup_doctor_controller_impl.dart';
import 'package:dentalmatching/features/doctor_features/signup/view/widgets/signup_doctor_form_body.dart';
import 'package:dentalmatching/features/patient_features/signup/view/widgets/upper_signup-widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupDoctorScreen extends StatelessWidget {
  const SignupDoctorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignupDoctorControllerImpl externalController =
        Get.put(SignupDoctorControllerImpl());
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Form(
        key: externalController.formKey,
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [UpperSignupWidget(), SignupDoctorFormBody()],
        ),
      ),
    );
  }
}


/** 
 * 
 * 
 * GetBuilder<SignupDoctorControllerImpl>(
          builder: (controller) => Column(
            children: [
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        controller.pickImage();
                      },
                      child: Icon(Icons.camera)),
                  const SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: controller.imageFile != null
                        ? FileImage(controller.imageFile!)
                        : null,
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    externalController.signup();
                  },
                  child: const Text("Signup"))
            ],
          ),
        ),
*/