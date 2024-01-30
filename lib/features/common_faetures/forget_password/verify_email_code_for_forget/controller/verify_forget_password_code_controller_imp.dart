import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/constants/routes_names.dart';
import 'package:dentalmatching/features/common_faetures/forget_password/verify_email_code_for_forget/controller/verify_forget_password_code_controller_abstract.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';

class VerifyForgetPasswordCodeControllerImp
    extends VerifyForgetPasswordCodeControllerAbstract {
  // VerifyEmailForForgetPasswordData dataModel =
  //     VerifyEmailForForgetPasswordData(Get.find());

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
    // requestStatus = RequestStatus.LOADING;
    // var response = await dataModel.postData(email: email, verifyCode: code);
    // requestStatus = HandlingResponseType.fun(response);
    // update();
    // if (requestStatus == RequestStatus.SUCCESS) {
    //   if (response["success"] == true) {
    goToRestPassword();
    //   } else {
    //     requestStatus = RequestStatus.FAILURE;
    //     update();
    //     Get.defaultDialog(
    //         title: "Try Again", middleText: "Verify Code Not Correct");
    //   }
    // }
  }

  @override
  void goToRestPassword() {
    Get.toNamed(AppRoutes.resetPassword, arguments: {"email": email});
  }
}
