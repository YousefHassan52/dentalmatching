import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/constants/routes_names.dart';
import 'package:dentalmatching/core/functions/block_action.dart';
import 'package:dentalmatching/core/functions/handling_response_type.dart';
import 'package:dentalmatching/core/shared/dialogue_without_buttons.dart';
import 'package:dentalmatching/features/common_faetures/forget_password/verify_email_code_for_forget/controller/verify_forget_password_code_controller_abstract.dart';
import 'package:dentalmatching/features/common_faetures/forget_password/verify_email_code_for_forget/data/verify_email_code_data.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';

class VerifyEmailForgetPasswordCodeControllerImp
    extends VerifyEmailForgetPasswordControllerAbstract {
  VerifyEmailForgetPasswordData dataModel =
      VerifyEmailForgetPasswordData(Get.find());
  late OtpFieldController verifyCodeController;
  late String email;

  RequestStatus? requestStatus;
  @override
  void onInit() {
    verifyCodeController = OtpFieldController();
    email = Get.arguments["email"];
    super.onInit();
  }

  @override
  void checkForgetPasswordCode({required String code}) async {
    requestStatus = RequestStatus.LOADING;
    update();
    var response = await dataModel.postData(email: email, verifyCode: code);
    requestStatus = HandlingResponseType.fun(response);
    update();
    if (requestStatus == RequestStatus.SUCCESS) {
      if (response["success"] == true) {
        goToRestPassword();
      }
    } else if (requestStatus == RequestStatus.UNAUTHORIZED_FAILURE) {
      customDialoge(
          title: "Try Again".tr, middleText: "Wrong Verification Code".tr);
    } else if (requestStatus == RequestStatus.BLOCKED_USER) {
      blockAction();
    } else {
      customDialoge(
          title: "Try Again".tr, middleText: "Server Error Please Try Again");
    }
  }

  @override
  void goToRestPassword() {
    Get.toNamed(AppRoutes.resetPassword, arguments: {"email": email});
  }
}
