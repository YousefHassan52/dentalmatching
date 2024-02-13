import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/functions/handling_response_type.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/data/Model/CaseDoctorModel.dart';
import 'package:dentalmatching/features/doctor_features/get_doctor_cases/controller/get_doctor_cases_controller_abstract.dart';
import 'package:dentalmatching/features/doctor_features/get_doctor_cases/data/get_doctor_cases.dart';
import 'package:dentalmatching/features/doctor_features/signup/data/models/doctor_model.dart';
import 'package:get/get.dart';

class GetDocotorCasesControllerImpl extends GetDocotorCasesControllerAbstract {
  MyServices myServices = Get.find();
  GetDoctorCasesData dataObject = GetDoctorCasesData(Get.find());
  RequestStatus? requestStatus;
  late DoctorModel doctorModel =
      DoctorModel.fromSharedPref(myServices.sharedPref);
  List<CaseDoctorModel> cases = [];

  @override
  void onInit() {
    getCases();
    doctorModel = DoctorModel.fromSharedPref(myServices.sharedPref);
    super.onInit();
  }

  @override
  Future<void> getCases() async {
    cases = [];
    requestStatus = RequestStatus.LOADING;
    update();
    var response = await dataObject.getCases(token: doctorModel.token);
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
      Get.defaultDialog(middleText: "Internet Connection Error Refresh Data ");
    } else {
      Get.defaultDialog(middleText: "Server Error Please Try Again");
    }

    update();
  }
}
