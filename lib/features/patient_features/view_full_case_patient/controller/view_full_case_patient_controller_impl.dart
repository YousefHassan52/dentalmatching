import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/functions/block_action.dart';
import 'package:dentalmatching/core/functions/handling_response_type.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/core/shared/dialogue_without_buttons.dart';
import 'package:dentalmatching/features/common_faetures/dental_case_comments/controller/comments_controller_impl.dart';
import 'package:dentalmatching/features/doctor_features/view_whole_case_for_doctor/data/model/progress_model.dart';
import 'package:dentalmatching/features/patient_features/view_casess/data/Model/case_model.dart';
import 'package:dentalmatching/features/patient_features/signup/data/model/patient_model.dart';
import 'package:dentalmatching/features/patient_features/view_full_case_patient/controller/view_full_case_patient_controller_abstract.dart';
import 'package:dentalmatching/features/patient_features/view_full_case_patient/data/view_full_case_data.dart';
import 'package:get/get.dart';

class ViewFullCasePatientControllerImpl
    extends ViewFullCasePatientControllerAbstract {
  MyServices myServices = Get.find();
  late PatientModel patient =
      PatientModel.fromSharedPref(myServices.sharedPref);
  late PatientCaseModel caseModel;
  ViewFullCasePatientData data = ViewFullCasePatientData(Get.find());
  RequestStatus? requestStatus;

 

  @override
  Future<void> deleteCase() async {
    requestStatus = RequestStatus.LOADING;
    update();
    var response =
        await data.deleteCase(token: patient.token, caseId: caseModel.caseId);
    print(response.toString());
    requestStatus = HandlingResponseType.fun(response);
    update();
    print("joe ;${requestStatus.toString()}");
    if (requestStatus == RequestStatus.SUCCESS) {
      if (response["success"] == true) {
        Get.back();
        Get.snackbar("Deleted Successfully".tr,
            "Your case has been deleted Successfully".tr);
      }
    } else if (requestStatus == RequestStatus.UNAUTHORIZED_FAILURE) {
      customDialoge(
          title: "Warning".tr, middleText: "Dental case already deleted !");
    } else if (requestStatus == RequestStatus.BLOCKED_USER) {
      blockAction();
    } else {
      customDialoge(
          title: "Try Again".tr, middleText: "Server Error Please Try Again");
    }

    update();
  }

  @override
  void onInit() {
    caseModel = Get.arguments["case"];
    CommentsControllerImpl commentsController =
        Get.put(CommentsControllerImpl());
    commentsController.getComments(
        caseId: caseModel.caseId, token: patient.token);
    super.onInit();

  }


  
}
