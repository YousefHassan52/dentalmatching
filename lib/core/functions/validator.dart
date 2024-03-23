import 'package:get/get.dart';

class AppValidator {
  static textFormFieldValidator(String value, String type) {
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
    if (type == "search") {
      if (value.isEmpty) {
        return "Write a word to search";
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
    if (type == "Description") {
      if (value.length < 20) {
        return "Your description must be more than 20 letters";
      }
    }
    if (type == "link") {
      final urlRegExp = RegExp(
          r'^(?:http|https):\/\/[\w\-_]+(?:\.[\w\-_]+)+[\w\-.,@?^=%&:/~\+#]*[\w\-@?^=%&/~\+#]$');
      if (!urlRegExp.hasMatch(value)) {
        return "You must paste a valid goole map link of hospital";
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
