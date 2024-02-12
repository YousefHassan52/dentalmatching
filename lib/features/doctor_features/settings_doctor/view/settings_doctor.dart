import 'package:dentalmatching/features/doctor_features/settings_doctor/controller/doctor_home_controller_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsDoctorScreen extends StatelessWidget {
  const SettingsDoctorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsDoctorControllerImpl controller =
        Get.put(SettingsDoctorControllerImpl());
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Text("university: ${controller.userModel.university}"),
            Text("name: ${controller.userModel.fullName}"),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  controller.logout();
                },
                child: const Text("Logout"))
          ],
        ),
      )),
    );
  }
}
