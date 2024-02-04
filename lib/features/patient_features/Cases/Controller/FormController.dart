import 'package:get/get.dart';

class ChronicDiseasesController extends GetxController {
  RxList<bool> checkedItems = List.generate(5, (index) => false).obs;
  RxBool showPressureChecklist = false.obs;
  RxString selectedPressureLevel = ''.obs;


  // List of chronic diseases
  final List<String> chronicDiseases = [
    'Heart Disease',
    'Diabetes',
    'Hypertension',
    'Asthma',
    'Arthritis',
  ];

  // List of pressure levels
  final List<String> pressureLevels = ['High', 'Low'];


  void handleCheckboxChange(int index, bool value) {
    checkedItems[index] = value;
    if (chronicDiseases[index] == 'Hypertension') {
      showPressureChecklist.value = value;
    }
    update();
  }

  void handlePressureLevelChange(String value) {
    selectedPressureLevel.value = value;
    update();
  }

  
}
