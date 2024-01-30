import 'package:get/get.dart';

abstract class LoginControllerAbstract extends GetxController {
  void changePasswordVisibility();
  void login();
  void goToSignupScreen();
  void goToForgetPassword();
}
