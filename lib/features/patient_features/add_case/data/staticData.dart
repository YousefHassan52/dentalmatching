import 'package:dentalmatching/features/patient_features/add_case/data/Model/CheckListModel.dart';
import 'package:get/get.dart';

class StaticData {
  // List of chronic diseases
  final List<CheckListModel> chronicDiseases = [
    CheckListModel(title: 'Autoimmune diseases'),
    CheckListModel(title: 'Diabetes'),
    CheckListModel(title: 'Blood Pressure'),
    CheckListModel(title: 'Cardiovascular diseases'),
    CheckListModel(title: 'None'),
  ];
  final List<CheckListModel> knownCases = [
    CheckListModel(title: 'Caries'),
    CheckListModel(title: 'Fixed Prosthodontics Crown and Bridge'),
    CheckListModel(title: 'Fixed Prosthodontics Implantology'),
    CheckListModel(title: 'Partial Removable Prosthodontics'),
    CheckListModel(title: 'Complete Removable Prosthodontics'),
    CheckListModel(title: 'Orthodontics'),
    CheckListModel(title: 'Gingivitis - periodontitis'),
    CheckListModel(title: 'Endodontics'),
    CheckListModel(title: 'Dental abscess'),
  ];

  // List of pressure levels
  final List<String> pressureLevels = [
    'High',
    'Low',
  ];

  //List Of Case Status
  final List<String> caseStatus = [
    'Known'.tr,
    'Unknown'.tr,
  ];
}
