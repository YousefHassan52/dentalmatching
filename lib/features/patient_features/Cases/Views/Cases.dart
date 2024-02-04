import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/features/patient_features/Cases/Controller/CounterController.dart';
import 'package:dentalmatching/features/patient_features/Cases/Views/AddCase.dart';
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
            onPressed: (){
            Get.back();
          },
        child: Text('Back'),
          textColor: Colors.black,
          ),
          MaterialButton(
            color: Colors.amber,
            onPressed: (){
            controller.AddedCase();
          },
        child: Text('Cases counter'),
          textColor: Colors.black,
          ),
          MaterialButton(
            color: Colors.amber,
            onPressed: (){
            Get.to(AddCaseScreen());
          },
          child: Text('Form Add cases'),
          textColor: Colors.black,
          ),
          MaterialButton(
            color: Colors.amber,
            onPressed: (){
              controller.Resest();
          },
        child: Text('Reset Counter'),
          textColor: Colors.black,
          ),
      
        ],
      ),
    );
  }
}