import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/functions/handling_response_type.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/features/patient_features/View_Cases/data/Model/case_model.dart';
import 'package:dentalmatching/features/patient_features/signup/data/model/patient_model.dart';
import 'package:dentalmatching/features/patient_features/view_full_case_patient/controller/view_full_case_patient_controller_abstract.dart';
import 'package:dentalmatching/features/patient_features/view_full_case_patient/data/view_full_case_data.dart';
import 'package:get/get.dart';

class ViewFullCasePatientControllerImpl
    extends ViewFullCasePatientControllerAbstract {
  MyServices myServices = Get.find();
  late PatientModel patient =
      PatientModel.fromSharedPref(myServices.sharedPref);
  late PatientCaseModel caseModel;
  ViewFullCasePatientData data = ViewFullCasePatientData(Get.find());
  RequestStatus? requestStatus;
  @override
  Future<void> deleteCase() async {
    requestStatus = RequestStatus.LOADING;
    update();
    var response =
        await data.deleteCase(token: patient.token, caseId: caseModel.caseId);
    print(response.toString());
    requestStatus = HandlingResponseType.fun(response);
    update();
    print("joe ;${requestStatus.toString()}");
    if (requestStatus == RequestStatus.SUCCESS) {
      if (response["success"] == true) {
        Get.back();
        Get.snackbar("Deleted Successfully".tr,
            "Your case has been deleted Successfully".tr);
      }
    } else if (requestStatus == RequestStatus.UNAUTHORIZED_FAILURE) {
      Get.defaultDialog(middleText: "Dental case already deleted !");
    } else {
      Get.defaultDialog(middleText: "Server Error Please Try Again");
    }

    update();
  }

  @override
  void onInit() {
    caseModel = Get.arguments["case"];

    super.onInit();
  }
}
