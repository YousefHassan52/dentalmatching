import 'package:get/get.dart';

abstract class VerifyEmailForgetPasswordControllerAbstract
    extends GetxController {
  void checkForgetPasswordCode({required String code});
  void goToRestPassword();
}
