import 'package:dentalmatching/core/services/my_services.dart';
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
              Get.to(PatientProfile());
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
              Get.to(AddCaseScreen());
            },
            child: Text('Form Add cases'),
            textColor: Colors.black,
          ),
          MaterialButton(
            color: Colors.amber,
            onPressed: () {
              controller.Resest();
            },
            child: Text('Reset Counter'),
            textColor: Colors.black,
          ),
          MaterialButton(
            color: Colors.amber,
            onPressed: () {
              Get.to(NoCases());
            },
            child: Text('NoCases'),
            textColor: Colors.black,
          ),
         
          MaterialButton(
            color: Colors.amber,
            onPressed: () {
              Get.to(HasCases());
            },
            child: Text('ConCases'),
            textColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
