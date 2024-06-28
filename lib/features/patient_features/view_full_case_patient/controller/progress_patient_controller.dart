import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/functions/handling_response_type.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/core/shared/dialogue_without_buttons.dart';
import 'package:dentalmatching/features/doctor_features/view_whole_case_for_doctor/data/model/progress_model.dart';
import 'package:dentalmatching/features/patient_features/signup/data/model/patient_model.dart';
import 'package:dentalmatching/features/patient_features/view_full_case_patient/data/view_full_case_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProgressPatientController extends GetxController {
  late String caseId;
  List<ProgressModel> progresses = [];

  List<Map<String, String>> progressEntries = [];
  List<bool> expandedStates = [];
  String progressText = '';
  late TextEditingController msgController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<bool> editStates = [];
  ViewFullCasePatientData data = ViewFullCasePatientData(Get.find());
  RequestStatus? requestStatus;
  MyServices myServices = Get.find();
  late PatientModel patientModel =
      PatientModel.fromSharedPref(myServices.sharedPref);

  @override
  void onInit() {
    // msgController = TextEditingController();
    caseId = Get.arguments["caseId"];
    getProgress(caseId);
    super.onInit();
  }

  
  void toggleAdded(int index) {
    expandedStates[index] = !expandedStates[index];
    update();
  }


  void editProgress(int index) {
    editStates[index] = !editStates[index];
    msgController.text = progressEntries[index]['text']!;
    update();
  }

  void saveEditedProgress(int index, String text) {
    if (formKey.currentState!.validate()) {
      progressEntries[index]['text'] = text;
      editStates[index] = false;
      msgController.clear();
      update();
    }
  }

  void cancelEdit(int index) {
    editStates[index] = false;
    msgController.clear();
    update();
  }

  Future<void> getProgress(caseId) async {
    progresses = [];
    requestStatus = RequestStatus.LOADING;
    update();
    var response = await data.getProgress(
        token: patientModel.token,
        caseId:caseId);
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
          editStates.add(false);
          progresses.add(myCase);
        }
      }
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
