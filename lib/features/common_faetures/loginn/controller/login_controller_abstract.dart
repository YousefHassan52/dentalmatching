import 'package:get/get.dart';

abstract class LoginControllerAbstract extends GetxController {
  void changePasswordVisibility();
  void login();
  void goToPreSignupScreen();
  void goToSignupScreen();
  void goToForgetPassword();
}
