import 'package:dentalmatching/features/patient_features/PatientProfile/Views/Widgets/CasesCounterWidget.dart';
import 'package:get/get.dart';

class CounterController extends GetxController{
  
  int counter = 0;
  void AddedCase (){
    counter++;
    update();
  }

}