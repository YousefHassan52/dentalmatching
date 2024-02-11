import 'package:dentalmatching/features/doctor_features/home/controller/doctor_home_controller_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorHomeScreen extends StatelessWidget {
  const DoctorHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DoctorHomeControllerImpl controller = Get.put(DoctorHomeControllerImpl());
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
