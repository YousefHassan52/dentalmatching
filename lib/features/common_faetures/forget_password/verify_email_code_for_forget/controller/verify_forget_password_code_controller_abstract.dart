import 'package:get/get.dart';

abstract class VerifyForgetPasswordCodeControllerAbstract
    extends GetxController {
  void checkForgetPasswordCode({required String code});
  void goToRestPassword();
}
