import 'package:dentalmatching/features/patient_features/View_Cases/data/Model/case_model.dart';
import 'package:dentalmatching/features/patient_features/view_full_case_patient/controller/view_full_case_patient_controller_abstract.dart';
import 'package:get/get.dart';

class ViewFullCasePatientControllerImpl
    extends ViewFullCasePatientControllerAbstract {
  late MyCaseModel caseModel;

  @override
  void onInit() {
    caseModel = Get.arguments["case"];

    super.onInit();
  }
}
