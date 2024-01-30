import 'package:get/get.dart';

class AppValidator {
  static const int _minPassword = 8;
  static const int _maxPassword = 46;

  static textFormFieldValidator(String value, String type) {
     if (value.isEmpty) {
    return "Please enter your $type";
  }
    if (type == "email") {
      if (!GetUtils.isEmail(value)) {
        return "invalid Email address";
      }
    }

    if (type == "username") {
      if (value.isEmpty) {
        return "invalid username";
      }
    }

    if (type == "phone") {
      if (!GetUtils.isPhoneNumber(value)) {
        return "invalid Phone number";
      }
    }
    if (type == "password") {
      if (value.isEmpty ||
          value.length < _minPassword ||
          value.length > _maxPassword) {
        return "invalid password";
      }
    }
  }

  static chechkPasswordMatching(
      secondPasswordValue, String firstPasswordValue) {
    if (secondPasswordValue.toString() != firstPasswordValue) {
      return "Passwords don't match ";
    }
  }
}
