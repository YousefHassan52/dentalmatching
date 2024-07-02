// ignore_for_file: avoid_print

import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/functions/handling_response_type.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/core/shared/dialogue_without_buttons.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/data/Model/CaseDoctorModel.dart';
import 'package:dentalmatching/features/doctor_features/search_cases/controller/search_cases_controller_abstract.dart';
import 'package:dentalmatching/features/doctor_features/search_cases/data/search_cases_data.dart';
import 'package:dentalmatching/features/doctor_features/signup/data/models/doctor_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchCasesControllerImpl extends SearchCasesControllerAbstract {
  MyServices myServices = Get.find();
  SearchCasesData dataObject = SearchCasesData(Get.find());
  RequestStatus? requestStatus;
  late DoctorModel doctorModel =
      DoctorModel.fromSharedPref(myServices.sharedPref);
  List<CaseDoctorModel> cases = [];

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController searchController;

  @override
  void onInit() {
    searchController = TextEditingController();
    super.onInit();
  }

  @override
  getCases() async {
    if (formKey.currentState!.validate()) {
      cases = [];
      requestStatus = RequestStatus.LOADING;
      update();
      var response = await dataObject.getCases(
          query: searchController.text, token: doctorModel.token);
      print(response.toString());
      update();
      requestStatus = HandlingResponseType.fun(response);
      print("joe ;${requestStatus.toString()}");
      if (requestStatus == RequestStatus.SUCCESS) {
        if (response["success"] == true) {
// Iterate over the response data and create MyCaseModel objects
          List<dynamic> responseData = response["data"];
          for (var data in responseData) {
            CaseDoctorModel myCase = CaseDoctorModel.fromJson(data);
            cases.add(myCase);
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
      } else {
        customDialoge(
            title: "Try Again".tr, middleText: "Server Error Please Try Again");
      }

      update();
    }
  }
}
