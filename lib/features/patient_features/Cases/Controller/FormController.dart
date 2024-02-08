import 'package:dentalmatching/features/patient_features/Cases/Model/CheckListModel.dart';
import 'package:get/get.dart';

class ChronicDiseasesController extends GetxController {
  RxList<bool> checkedItems = List.generate(6, (index) => false).obs;
  RxBool showPressureChecklist = false.obs;
  RxString pressure = ''.obs;
  RxString selected = ''.obs;

// List of chronic diseases
  final List<CheckListModel> chronicDiseases = [
    CheckListModel(title: 'Heart Disease'),
    CheckListModel(title: 'Diabetes'),
    CheckListModel(title: 'Hypertension'),
    CheckListModel(title: 'Asthma'),
    CheckListModel(title: 'Arthritis'),
    CheckListModel(title: 'None'),
  ];
  final List<CheckListModel> knownCases = [
    CheckListModel(title: 'Heart Disease'),
    CheckListModel(title: 'Diabetes'),
    CheckListModel(title: 'Hypertension'),
    CheckListModel(title: 'Asthma'),
    CheckListModel(title: 'Arthritis'),
    CheckListModel(title: 'None'),
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

  void handleSelectionKnown(String value) {
    selected.value = value;
    update();
  }

  void handleSelectionPressure(String value) {
    pressure.value = value;
    update();
  }

  
}
