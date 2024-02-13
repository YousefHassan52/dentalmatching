import 'package:dentalmatching/features/patient_features/AddCase/Model/CheckListModel.dart';

class StaticData {
   // List of chronic diseases
  final List<CheckListModel> chronicDiseases = [
    CheckListModel(title: 'Heart Disease'),
    CheckListModel(title: 'Diabetes'),
    CheckListModel(title: 'Blood Pressure'),
    CheckListModel(title: 'Cardiovascular'),
    CheckListModel(title: 'Cancer'),
    CheckListModel(title: 'None'),
  ];
  final List<CheckListModel> knownCases = [
    CheckListModel(title: 'Gumboil'),
    CheckListModel(title: 'Gingivitis'),
    CheckListModel(title: 'Edentulous'),
    CheckListModel(title: 'Displaced tooth'),
    CheckListModel(title: 'Dental abscess'),
    CheckListModel(title: 'Orthodontics'),
    CheckListModel(title: 'Caries'),
    CheckListModel(title: 'Endodontics'),
    CheckListModel(title: 'Prosthodontic'),
    CheckListModel(title: 'Implantology'),
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