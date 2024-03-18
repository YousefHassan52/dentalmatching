import 'package:dentalmatching/features/patient_features/View_Cases/View/HasCases.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/view/profile_patient_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePatientController extends GetxController {
  int currentIndex = 0;
  void changeIndex(int index) {
    currentIndex = index;
    update();
  }

  List<Widget> screens = [
    const HasCases(),
    const SettingsPatientScreen(),
  ];
}
