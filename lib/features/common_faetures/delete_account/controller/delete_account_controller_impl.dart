import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/functions/handling_response_type.dart';
import 'package:dentalmatching/features/common_faetures/delete_account/controller/delete_account_abstract_controller.dart';
import 'package:dentalmatching/features/common_faetures/delete_account/data/my_cases_patient_data.dart';
import 'package:get/get.dart';

class DeleteAccountControllerImp extends DeleteAccountControllerAbstract {
  DeleteAccountData deleteAccountData = DeleteAccountData(Get.find());
  RequestStatus? requestStatus;
  @override
  Future<void> deleteAccount({required String token}) async {
    requestStatus = RequestStatus.LOADING;
    update();
    var response = await deleteAccountData.deleteAccount(token: token);
    print(response.toString());
    requestStatus = HandlingResponseType.fun(response);
    update();
    print("joe ;${requestStatus.toString()}");
    if (requestStatus == RequestStatus.SUCCESS) {
      if (response["success"] == true) {
        Get.snackbar("Deleted Successfully".tr,
            "Your Account has been Deleted Successfully".tr);
      }
    } else if (requestStatus == RequestStatus.UNAUTHORIZED_FAILURE) {
      Get.defaultDialog(
         title: "Alert".tr,
        middleText: "Internet Connection Error Refresh Data".tr);
    } else {
      Get.defaultDialog(
        title: "Alert".tr,
        middleText: "Server Error Please Try Again");
    }

    update();
  }
}
