import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/functions/handling_response_type.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/features/doctor_features/get_doctor_cases/controller/get_doctor_cases_controller_impl.dart';
import 'package:dentalmatching/features/doctor_features/report_case/controller/report_controller_abstract.dart';
import 'package:dentalmatching/features/doctor_features/report_case/data/report_data.dart';
import 'package:dentalmatching/features/doctor_features/signup/data/models/doctor_model.dart';
import 'package:get/get.dart';

class ReportControllerImpl extends ReportCaseControllerAbstract {
  MyServices myServices = Get.find();
  ReportCaseData dataObject = ReportCaseData(Get.find());
  RequestStatus? requestStatus;
  late DoctorModel doctorModel =
      DoctorModel.fromSharedPref(myServices.sharedPref);

  @override
  void reportCase({required String caseId}) async {
    requestStatus = RequestStatus.LOADING;
    update();
    var response =
        await dataObject.reportCase(token: doctorModel.token, caseId: caseId);
    print(response.toString());
    update();
    requestStatus = HandlingResponseType.fun(response);
    print("joe ;${requestStatus.toString()}");
    if (requestStatus == RequestStatus.SUCCESS) {
      Get.snackbar("Success".tr, "This case has been reported successfuly".tr);
      _reloadCases();
    } else if (requestStatus == RequestStatus.UNAUTHORIZED_FAILURE) {
      Get.defaultDialog(
          title: "Warning".tr,
          middleText: "This case han been reported before".tr);
    } else {
      Get.defaultDialog(middleText: "Server Error Please Try Again");
    }

    update();
  }

  void _reloadCases() {
    GetDocotorCasesControllerImpl cases =
        Get.put(GetDocotorCasesControllerImpl());
    cases.getCases();
  }
}
