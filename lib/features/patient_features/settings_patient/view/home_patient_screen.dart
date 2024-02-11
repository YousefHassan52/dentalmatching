import 'package:dentalmatching/features/patient_features/settings_patient/controller/settings_controller_imp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPatientScreen extends StatelessWidget {
  const SettingsPatientScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsPatientControllerImp controller =
        Get.put(SettingsPatientControllerImp());
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 88,
          ),
          Center(child: Text("${controller.userModel.toString()}")),
          const SizedBox(
            height: 20,
          ),
          TextButton(
              onPressed: () {
                controller.logout();
              },
              child: Text("logout"))
        ],
      ),
    );
  }
}
