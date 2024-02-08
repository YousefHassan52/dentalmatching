import 'package:get/get.dart';

class AppValidator {
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
      if (!RegExp(r'^\d{11}$').hasMatch(value)) {
        return "invalid Phone number";
      }
    }
    if (type == "password") {
      RegExp strongPasswordRegex = RegExp(
        r'^(?=.*\d)(?=.*[a-zA-Z])(?=.*[A-Z])(?=.*[!@#\$%^&*(),.?":{}|<>]).{6,}$',
      );
      if (!strongPasswordRegex.hasMatch(value)) {
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

  static bool validateCheckbox(List<bool> checkedItems) {
    return checkedItems.any((item) => item);
  }


}
