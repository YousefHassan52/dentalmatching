import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/functions/handling_response_type.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/features/patient_features/View_Cases/Controller/mycases_patient_controller_abstract.dart';
import 'package:dentalmatching/features/patient_features/View_Cases/data/Model/case_model.dart';
import 'package:dentalmatching/features/patient_features/View_Cases/data/my_cases_patient_data.dart';
import 'package:dentalmatching/features/patient_features/signup/data/model/patient_model.dart';
import 'package:get/get.dart';

class MyCasesPatientControllerImpl extends MyCasesPatientControllerAbstract {
  MyServices myServices = Get.find();
  MyCasesPatientData myCasesPatientData = MyCasesPatientData(Get.find());
  RequestStatus? requestStatus;
  late PatientModel patientModel =
      PatientModel.fromSharedPref(myServices.sharedPref);
  List<MyCaseModel> myCases = [];

  initializeUserData() {
    getCases();
  }

  @override
  void onInit() {
    getCases();
    patientModel = PatientModel.fromSharedPref(myServices.sharedPref);
    super.onInit();
  }

  @override
  void getCases() async {
    myCases = [];
    requestStatus = RequestStatus.LOADING;
    update();
    var response =
        await myCasesPatientData.getMyCases(token: patientModel.token);
    print(response.toString());
    update();
    requestStatus = HandlingResponseType.fun(response);
    print("joe ;${requestStatus.toString()}");
    if (requestStatus == RequestStatus.SUCCESS) {
      if (response["success"] == true) {
// Iterate over the response data and create MyCaseModel objects
        List<dynamic> responseData = response["data"];
        for (var data in responseData) {
          MyCaseModel myCase = MyCaseModel.fromJson(data);
          myCases.add(myCase);
        }
        if (response["message"] == "No Dental Cases Available") {
          requestStatus = RequestStatus.EMPTY_SUCCESS;
          update();
        }
      }
    } else if (requestStatus == RequestStatus.UNAUTHORIZED_FAILURE) {
      Get.defaultDialog(middleText: "Internet Connection Error Refresh Data ");
    } else {
      Get.defaultDialog(middleText: "Server Error Please Try Again");
    }

    update();
  }
}
