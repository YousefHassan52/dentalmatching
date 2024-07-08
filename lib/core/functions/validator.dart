import 'package:get/get.dart';

class AppValidator {
  static textFormFieldValidator(String value, String type) {
    if (type == "email") {
      if (!GetUtils.isEmail(value)) {
        return "Invalid Email Address".tr;
      }
    }

    if (type == "username") {
      if (value.isEmpty) {
        return "Invalid Username".tr;
      }
    }
    if (type == "search") {
      if (value.isEmpty) {
        return "Write a Keyword to Search".tr;
      }
    }

    if (type == "phone") {
      if (!RegExp(r'^\d{11}$').hasMatch(value)) {
        return "Invalid Phone Number".tr;
      }
    }
    if (type == "password") {
      RegExp strongPasswordRegex = RegExp(
        r'^(?=.*\d)(?=.*[a-zA-Z])(?=.*[A-Z])(?=.*[!@#\$%^&*(),.?":{}|<>]).{6,}$',
      );
      if (!strongPasswordRegex.hasMatch(value)) {
        return "Invalid Password".tr;
      }
    }
    if (type == "Description") {
      if (value.length < 20) {
        return "Your description must be more than 20 letters".tr;
      }
      if (value.length > 350) {
        return "Your description must be less than 350 letters".tr;
      }
    }
    if (type == "Progress") {
      if (value.length < 20) {
        return "Your Progress must be more than 20 letters".tr;
      }
    }
    if (type == "link") {
      final urlRegExp = RegExp(
          r'^(?:http|https):\/\/[\w\-_]+(?:\.[\w\-_]+)+[\w\-.,@?^=%&:/~\+#]*[\w\-@?^=%&/~\+#]$');
      if (!urlRegExp.hasMatch(value)) {
        return "You Must Paste a Valid Google Map Link of Hospital".tr;
      }
    }
    if (type == "location") {
      if (value.isEmpty) {
        return "Write Hospital Name".tr;
      }
    }
  }

  static chechkPasswordMatching(
      secondPasswordValue, String firstPasswordValue) {
    if (secondPasswordValue.toString() != firstPasswordValue) {
      return "Password Doesn't Match ".tr;
    }
  }

  static bool validateCheckbox(List<bool> checkedItems) {
    return checkedItems.any((item) => item);
  }
}
