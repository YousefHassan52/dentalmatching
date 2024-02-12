import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/data/Model/CaseDoctorModel.dart';
import 'package:dentalmatching/features/doctor_features/view_whole_case_for_doctor/controller/view_whole_case_doctor_controller_abstract.dart';
import 'package:get/get.dart';

class ViewWholeCaseDoctorControllerImpl
    extends ViewWholeCaseDoctorControllerAbstract {
  late CaseDoctorModel caseModel;
  bool viewPhone = false;

  @override
  void onInit() {
    caseModel = Get.arguments["case"];

    super.onInit();
  }
}
