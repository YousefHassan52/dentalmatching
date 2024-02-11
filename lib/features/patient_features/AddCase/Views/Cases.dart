import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/features/doctor_features/DoctorProfile/View/DrProfile.dart';
import 'package:dentalmatching/features/patient_features/AddCase/Views/AddCase.dart';
import 'package:dentalmatching/features/patient_features/PatientProfile/Views/PatientProfile.dart';
import 'package:dentalmatching/features/patient_features/View_Cases/View/HasCases.dart';
import 'package:dentalmatching/features/patient_features/View_Cases/View/NoCases.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CasesScreen extends GetView<MyServices> {
  const CasesScreen({super.key});
// CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            color: Colors.amber,
            onPressed: () {
              Get.to(const PatientProfile());
            },
            textColor: Colors.black,
            child: const Text('Back'),
          ),
          MaterialButton(
            color: Colors.amber,
            onPressed: () {
              controller.AddedCase();
            },
            textColor: Colors.black,
            child: const Text('Cases counter'),
          ),
          MaterialButton(
            color: Colors.amber,
            onPressed: () {
              Get.to(const AddCaseScreen());
            },
            textColor: Colors.black,
            child: const Text('Form Add cases'),
          ),
          MaterialButton(
            color: Colors.amber,
            onPressed: () {
              controller.Resest();
            },
            textColor: Colors.black,
            child: const Text('Reset Counter'),
          ),
          MaterialButton(
            color: Colors.amber,
            onPressed: () {
              Get.to(const NoCases());
            },
            textColor: Colors.black,
            child: const Text('NoCases'),
          ),
          MaterialButton(
            color: Colors.amber,
            onPressed: () {
              Get.to(const HasCases());
            },
            textColor: Colors.black,
            child: const Text('ConCases'),
          ),
          MaterialButton(
            color: Colors.amber,
            onPressed: () {
              Get.to(const DrProfile());
            },
            textColor: Colors.black,
            child: const Text('Dr'),
          ),
        ],
      ),
    );
  }
}
