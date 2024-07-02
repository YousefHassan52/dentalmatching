// ignore_for_file: avoid_print

import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/functions/block_action.dart';
import 'package:dentalmatching/core/functions/handling_response_type.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/core/shared/dialogue_without_buttons.dart';
import 'package:dentalmatching/features/patient_features/view_casess/Controller/mycases_patient_controller_abstract.dart';
import 'package:dentalmatching/features/patient_features/view_casess/data/Model/case_model.dart';
import 'package:dentalmatching/features/patient_features/view_casess/data/my_cases_patient_data.dart';
import 'package:dentalmatching/features/patient_features/signup/data/model/patient_model.dart';
import 'package:get/get.dart';

class MyCasesPatientControllerImpl extends MyCasesPatientControllerAbstract {
  MyServices myServices = Get.find();
  MyCasesPatientData myCasesPatientData = MyCasesPatientData(Get.find());
  RequestStatus? requestStatus;
  late PatientModel patientModel =
      PatientModel.fromSharedPref(myServices.sharedPref);
  List<PatientCaseModel> myCases = [];

  initializeUserData() {
    getCases();
  }

  @override
  void onInit() {
    getCases();
    patientModel =
        PatientModel.fromSharedPref(myServices.sharedPref); // el mafrod tet4al
    super.onInit();
  }

  @override
  void getCases() async {
    myCases = [];
    update();
    requestStatus = RequestStatus.LOADING;
    update();
    var response =
        await myCasesPatientData.getMyCases(token: patientModel.token);
    print(response.toString());
    requestStatus = HandlingResponseType.fun(response);
    update();
    print("joe ;${requestStatus.toString()}");
    if (requestStatus == RequestStatus.SUCCESS) {
      if (response["success"] == true) {
// Iterate over the response data and create MyCaseModel objects
        List<dynamic> responseData = response["data"];
        for (var data in responseData) {
          PatientCaseModel myCase = PatientCaseModel.fromJson(data);
          myCases.add(myCase);
          update();
        }
        if (response["message"] == "No Dental Cases Available") {
          requestStatus = RequestStatus.EMPTY_SUCCESS;
          update();
        }
      }
    } else if (requestStatus == RequestStatus.UNAUTHORIZED_FAILURE) {
      customDialoge(
          title: "Try Again".tr,
          middleText: "Internet Connection Error Refresh Data ");
    } else if (requestStatus == RequestStatus.BLOCKED_USER) {
      blockAction();
    } else {
      customDialoge(
          title: "Try Again".tr, middleText: "Server Error Please Try Again");
    }

    update();
  }
}
