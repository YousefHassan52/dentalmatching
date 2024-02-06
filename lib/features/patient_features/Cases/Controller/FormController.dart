import 'package:dentalmatching/features/patient_features/Cases/Model/CheckListModel.dart';
import 'package:get/get.dart';

class ChronicDiseasesController extends GetxController {
  RxList<bool> checkedItems = List.generate(5, (index) => false).obs;
  RxBool showPressureChecklist = false.obs;
  RxString selected = ''.obs;

// List of chronic diseases
  final List<CheckListModel> chronicDiseases = [
    CheckListModel(title: 'Heart Disease'),
    CheckListModel(title: 'Diabetes'),
    CheckListModel(title: 'Hypertension'),
    CheckListModel(title: 'Asthma'),
    CheckListModel(title: 'Arthritis'),
  ];

  // List of pressure levels
  final List<String> pressureLevels = [
    'High',
    'Low',
  ];

  //List Of Case Status
  final List<String> caseStatus = [
    'Known',
    'Unkown',
  ];

  void handleCheckboxChange(int index, bool value) {
    checkedItems[index] = value;
    if (chronicDiseases[index].title == 'Hypertension') {
      showPressureChecklist.value = value;
    }
    update();
  }

  // void handlePressureLevelChange(String value) {
  //   selected.value = value;
  //   update();
  // }

  void handleSelection(String value) {
    selected.value = value;
    update();
  }
}
