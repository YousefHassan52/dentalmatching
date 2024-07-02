// ignore_for_file: avoid_print

import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/functions/handling_response_type.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/core/shared/dialogue_without_buttons.dart';
import 'package:dentalmatching/features/doctor_features/view_whole_case_for_doctor/data/model/progress_model.dart';
import 'package:dentalmatching/features/patient_features/signup/data/model/patient_model.dart';
import 'package:dentalmatching/features/patient_features/view_full_case_patient/data/view_full_case_data.dart';
import 'package:get/get.dart';

class ProgressPatientController extends GetxController {
  late String caseId;
  List<ProgressModel> progresses = [];
  List<bool> expandedStates = [];

  ViewFullCasePatientData data = ViewFullCasePatientData(Get.find());
  RequestStatus? requestStatus;
  MyServices myServices = Get.find();
  late PatientModel patientModel =
      PatientModel.fromSharedPref(myServices.sharedPref);

  @override
  void onInit() {
    caseId = Get.arguments["caseId"];
    getProgress(caseId);
    super.onInit();
  }

  void toggleAdded(int index) {
    expandedStates[index] = !expandedStates[index];
    update();
  }

  void closeAllExpanded() {
    for (int i = 0; i < expandedStates.length; i++) {
      expandedStates[i] = false;
    }
    update();
  }
  
  Future<void> getProgress(caseId) async {
    progresses = [];
    requestStatus = RequestStatus.LOADING;
    update();
    var response =
        await data.getProgress(token: patientModel.token, caseId: caseId);
    print(response.toString());
    update();
    requestStatus = HandlingResponseType.fun(response);
    print("joe ;${requestStatus.toString()}");
    if (requestStatus == RequestStatus.SUCCESS) {
      if (response["success"] == true) {
        List<dynamic> responseData = response["data"];
        for (int i = responseData.length - 1; i >= 0; i--) {
          var data = responseData[i];
          ProgressModel myCase = ProgressModel.fromJson(data);
          expandedStates.add(false);
          progresses.add(myCase);
        }
      }
    } else if (progresses.isEmpty) {
      print("Empty List Progress");
    } else if (requestStatus == RequestStatus.UNAUTHORIZED_FAILURE) {
      customDialoge(
          title: "Try Again".tr,
          middleText: "Internet Connection Error Refresh Data ");
    } else {
      customDialoge(
          title: "Try Again".tr, middleText: "Server Error Please Try Again");
    }

    update();
  }
}
