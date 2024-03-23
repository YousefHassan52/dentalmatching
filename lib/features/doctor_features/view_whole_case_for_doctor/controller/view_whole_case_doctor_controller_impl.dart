import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/functions/handling_response_type.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/controller/unassigned_cases_doctor_controller_impl.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/data/Model/CaseDoctorModel.dart';
import 'package:dentalmatching/features/doctor_features/get_doctor_cases/controller/get_doctor_cases_controller_impl.dart';
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
  Future<void> requestCase(
      {required String time, required String googleMapLink}) async {
    requestStatus = RequestStatus.LOADING;
    update();
    var response = await data.requestCase(
        googleMapLink: googleMapLink,
        time: time,
        caseId: caseModel.caseId,
        token: doctorModel.token);
    print(response.toString());
    requestStatus = HandlingResponseType.fun(response);
    update();
    print("joe ;${requestStatus.toString()}");
    if (requestStatus == RequestStatus.SUCCESS) {
      if (response["success"] == true) {
        Get.snackbar("Success", "Now you are responsible with this case");
        viewPhone = true;
        update();
        updateAssignmentStatus(true);
        GetDocotorCasesControllerImpl doctorCases =
            Get.put(GetDocotorCasesControllerImpl());
        doctorCases.getCases();
      }
    } else if (requestStatus == RequestStatus.UNAUTHORIZED_FAILURE) {
      Get.defaultDialog(
          middleText: "Case is already requested by anothe doctor");
    } else {
      Get.defaultDialog(middleText: "Server Error Please Try Again");
    }

    update();
  }

  void updateAssignmentStatus(bool isAssigned) {
    caseModel.isAssigned = isAssigned;
    // Trigger a rebuild of the widget that uses this controller
    update();
  }

  @override
  Future<void> cancelCase() async {
    requestStatus = RequestStatus.LOADING;
    update();
    var response = await data.cancelCase(
        caseId: caseModel.caseId, token: doctorModel.token);
    print(response.toString());
    requestStatus = HandlingResponseType.fun(response);
    update();
    print("joe ;${requestStatus.toString()}");
    if (requestStatus == RequestStatus.SUCCESS) {
      if (response["success"] == true) {
        Get.snackbar(
            "Case Cancelled", "You are not responsible for this case any more");
      }

      updateAssignmentStatus(true);
    } else if (requestStatus == RequestStatus.UNAUTHORIZED_FAILURE) {
      Get.defaultDialog(middleText: "Case is already not assigned to you");
    } else {
      Get.defaultDialog(middleText: "Server Error Please Try Again");
    }

    update();
  }
}
