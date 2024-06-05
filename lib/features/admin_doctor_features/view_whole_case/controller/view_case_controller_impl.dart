import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/functions/handling_response_type.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/core/shared/dialogue_without_buttons.dart';
import 'package:dentalmatching/features/admin_doctor_features/home/data/model/admin_doctor_model.dart';
import 'package:dentalmatching/features/admin_doctor_features/view_whole_case/controller/view_case_controller_abstract.dart';
import 'package:dentalmatching/features/admin_doctor_features/view_whole_case/data/View_whole_case_for_admin_data.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/data/Model/CaseDoctorModel.dart';
import 'package:dentalmatching/features/patient_features/add_case/data/staticData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewWholeCaseForAdminControllerImp
    extends ViewWholeCaseForAdminControllerAbstract {
  StaticData list = StaticData();
  ViewWholeCaseForAdminData dataObject = ViewWholeCaseForAdminData(Get.find());

  List<bool> checkedCase = List.generate(10, (index) => false);
  List<String> selectedDentalCases = [];
  RequestStatus? requestStatus;
  late AdminDoctorModel userModel =
      AdminDoctorModel.fromSharedPref(myServices.sharedPref);
  MyServices myServices = Get.find();
  late AdminDoctorModel doctorModel =
      AdminDoctorModel.fromSharedPref(myServices.sharedPref);
  late CaseDoctorModel caseModel;
  @override
  void onInit() {
    caseModel = Get.arguments["case_admin"];
    super.onInit();
  }

  void handleCheckboxChangeCases(int index, bool value) {
    checkedCase[index] = value;
    selectedDentalCases = [];
    for (int i = 0; i < checkedCase.length; i++) {
      if (checkedCase[i]) {
        selectedDentalCases.add(list.knownCases[i].title);
      }
    }
    print('Selected Titles: $selectedDentalCases');
    update();
  }

  @override
  void classify() async {
    if (caseValidation()) {
      requestStatus = RequestStatus.LOADING;
      update();
      var response = await dataObject.classify(
          token: userModel.token,
          caseId: caseModel.caseId,
          dentalClassifications: selectedDentalCases);
      print(response.toString());
      update();
      requestStatus = HandlingResponseType.fun(response);
      print("joe ;${requestStatus.toString()}");
      if (requestStatus == RequestStatus.SUCCESS) {
        if (response["success"] == true) {
          Get.snackbar("Case Classified",
              "${caseModel.patientName.capitalizeFirst}'s Case Classifed Successfully");
        }
      } else if (requestStatus == RequestStatus.UNAUTHORIZED_FAILURE) {
        customDialoge(
            title: "Warning".tr, middleText: "Case Already Classified");
      } else {
        customDialoge(
            title: "Warning".tr, middleText: "Server Error Please Try Again");
      }

      update();
    }
  }

  bool caseValidation() {
    if (selectedDentalCases.isEmpty) {
      customDialoge(
        title: "Warning".tr,
        middleText: 'Please select your case.',
      );
      return false; // Validation failed
    }
    return true; // Validation passed
  }
}
