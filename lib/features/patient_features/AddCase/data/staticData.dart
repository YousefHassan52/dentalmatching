import 'package:dentalmatching/features/patient_features/AddCase/Model/CheckListModel.dart';
import 'package:get/get.dart';

class StaticData {
   // List of chronic diseases
  final List<CheckListModel> chronicDiseases = [
    CheckListModel(title: 'Heart Disease'.tr),
    CheckListModel(title: 'Diabetes'.tr),
    CheckListModel(title: 'Blood Pressure'.tr),
    CheckListModel(title: 'Cardiovascular'.tr),
    CheckListModel(title: 'Cancer'.tr),
    CheckListModel(title: 'None'.tr),
  ];
  final List<CheckListModel> knownCases = [
    CheckListModel(title: 'Gumboil'.tr),
    CheckListModel(title: 'Gingivitis'.tr),
    CheckListModel(title: 'Edentulous'.tr),
    CheckListModel(title: 'Displaced tooth'.tr),
    CheckListModel(title: 'Dental abscess'.tr),
    CheckListModel(title: 'Orthodontics'.tr),
    CheckListModel(title: 'Caries'.tr),
    CheckListModel(title: 'Endodontics'.tr),
    CheckListModel(title: 'Prosthodontic'.tr),
    CheckListModel(title: 'Implantology'.tr),
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