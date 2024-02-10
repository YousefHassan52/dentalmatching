import 'package:dentalmatching/features/patient_features/AddCase/Model/CheckListModel.dart';

class StaticData {
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
    CheckListModel(title: 'خلع'),
    CheckListModel(title: 'مش خلع'),
  ];

  // List of pressure levels
  final List<String> pressureLevels = [
    'High',
    'Low',
  ];

  //List Of Case Status
  final List<String> caseStatus = [
    'Known',
    'Unknown',
  ];
}