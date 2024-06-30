import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/functions/handling_response_type.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/core/shared/dialogue_without_buttons.dart';
import 'package:dentalmatching/features/doctor_features/signup/data/models/doctor_model.dart';
import 'package:dentalmatching/features/doctor_features/view_whole_case_for_doctor/data/model/progress_model.dart';
import 'package:dentalmatching/features/doctor_features/view_whole_case_for_doctor/data/request_case_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProgressController extends GetxController {
  late String caseId;
  List<ProgressModel> progresses = [];
  bool isExpandedAdd = false;
  String progressText = '';
  late TextEditingController msgController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<bool> expandedStates = [];
  List<bool> editStates = [];
  RequestCaseData data = RequestCaseData(Get.find());
  RequestStatus? requestStatus;
  MyServices myServices = Get.find();
  late DoctorModel doctorModel =
      DoctorModel.fromSharedPref(myServices.sharedPref);

  @override
  void onInit() {
    msgController = TextEditingController();
    caseId = Get.arguments["caseId"];
    getProgress(caseId);
    super.onInit();
  }

  void toggleAdd() {
    isExpandedAdd = !isExpandedAdd;
    update();
  }

  void saveProgress(String text, String caseId) async {
    if (formKey.currentState!.validate()) {
      print(msgController.text);

      requestStatus = RequestStatus.LOADING;
      update();
      var response = await data.addProgress(
          token: doctorModel.token,
          caseId: caseId,
          progressMessage: msgController.text);
      print(response.toString());
      update();
      requestStatus = HandlingResponseType.fun(response);
      print("joe ;${requestStatus.toString()}");
      if (requestStatus == RequestStatus.SUCCESS) {
        Get.snackbar("Success", "progress added");

        // _reloadCases();
      } else if (requestStatus == RequestStatus.UNAUTHORIZED_FAILURE) {
        customDialoge(title: "Warning".tr, middleText: "unexpected error");
      } else {
        customDialoge(
            title: "Try Again".tr, middleText: "Server Error Please Try Again");
      }

      update();
      msgController.clear();
      isExpandedAdd = false;
      update();
    }
  }

  void toggleAdded(int index) {
    if (index >= 0 && index < expandedStates.length) {
      expandedStates[index] = !expandedStates[index];
      update();
    }
  }

  void cancelAdd() {
    msgController.clear();
    isExpandedAdd = false;
    update();
  }

  void editProgress(int index) {
    if (index >= 0 && index < editStates.length) {
      editStates[index] = !editStates[index];
      msgController.text = progresses[index].progressMessage;
      update();
    }
  }

  void saveEditedProgress(int index, String text) async {
    if (index >= 0 && index < editStates.length && index < progresses.length) {
      if (formKey.currentState!.validate()) {
      requestStatus = RequestStatus.LOADING;
      update();
      var response = await data.editProgress(
          token: doctorModel.token,
          caseId: caseId,
          progressMessage: msgController.text,
          progressId: progresses[index].id);
      update();
      requestStatus = HandlingResponseType.fun(response);
      if (requestStatus == RequestStatus.SUCCESS) {
        Get.snackbar("Success".tr, "Progress Edited Successfully".tr);
        await getProgress(caseId); // Reload progress after editing
      } else {
        customDialoge(
            title: "Try Again".tr, middleText: "Server Error Please Try Again");
      }
      msgController.clear();
      editStates[index] = false;
      update();
    }
    }
  }

  void cancelEdit(int index) {
    if (index >= 0 && index < editStates.length) {
      editStates[index] = false;
      msgController.clear();
      update();
    }
  }

  Future<void> getProgress(caseId) async {
    progresses = [];
    requestStatus = RequestStatus.LOADING;
    update();

    var response =
        await data.getProgress(token: doctorModel.token, caseId: caseId);

    print(response.toString());

    requestStatus = HandlingResponseType.fun(response);
    print("joe ;${requestStatus.toString()}");

    update();

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
      } else {
        customDialoge(
            title: "Try Again", middleText: "Server Error Please Try Again");
      }
    } else if (progresses.isEmpty) {
      print("Empty List Progress");
    } else if (requestStatus == RequestStatus.UNAUTHORIZED_FAILURE) {
      customDialoge(
          title: "Try Again",
          middleText: "Internet Connection Error Refresh Data ");
    } else {
      customDialoge(
          title: "Try Again", middleText: "Server Error Please Try Again");
    }
    update();
  }
}
