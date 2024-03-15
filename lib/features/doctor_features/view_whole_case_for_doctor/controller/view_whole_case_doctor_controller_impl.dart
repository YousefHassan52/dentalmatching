import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/functions/handling_response_type.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/data/Model/CaseDoctorModel.dart';
import 'package:dentalmatching/features/doctor_features/signup/data/models/doctor_model.dart';
import 'package:dentalmatching/features/doctor_features/view_whole_case_for_doctor/controller/view_whole_case_doctor_controller_abstract.dart';
import 'package:dentalmatching/features/doctor_features/view_whole_case_for_doctor/data/request_case_data.dart';
import 'package:get/get.dart';

class ViewWholeCaseDoctorControllerImpl
    extends ViewWholeCaseDoctorControllerAbstract {
  MyServices myServices = Get.find();
  late DoctorModel doctorModel =
      DoctorModel.fromSharedPref(myServices.sharedPref);
  late CaseDoctorModel caseModel;
  bool viewPhone = false;
  RequestCaseData data = RequestCaseData(Get.find());
  RequestStatus? requestStatus;

  @override
  void onInit() {
    caseModel = Get.arguments["case"];

    super.onInit();
  }

  @override
  Future<void> requestCase({required String caseId}) async {
    requestStatus = RequestStatus.LOADING;
    update();
    var response =
        await data.requestCase(caseId: caseId, token: doctorModel.token);
    print(response.toString());
    requestStatus = HandlingResponseType.fun(response);
    update();
    print("joe ;${requestStatus.toString()}");
    if (requestStatus == RequestStatus.SUCCESS) {
      if (response["success"] == true) {
        viewPhone = true;
        update();
      }
    } else if (requestStatus == RequestStatus.UNAUTHORIZED_FAILURE) {
      Get.defaultDialog(
          middleText: "Case is already requested by anothe doctor");
    } else {
      Get.defaultDialog(middleText: "Server Error Please Try Again");
    }

    update();
  }
}
