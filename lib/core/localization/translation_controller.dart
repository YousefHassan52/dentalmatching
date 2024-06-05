import 'package:dentalmatching/core/constants/themes.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TranslationController extends GetxController {
  MyServices myServices = Get.find();
  void changeLang({required String langCode}) {
    Locale locale = Locale(langCode);
    myServices.sharedPref.setString("lang", langCode);
    Get.updateLocale(locale);
  }

  Locale getCurrentLocale() {
    if (kDebugMode) {
      print(myServices.sharedPref.getString("lang") ?? "null ya joe");
    }
    if (myServices.sharedPref.getString("lang") == null) {
      myServices.sharedPref.setString("lang", Get.deviceLocale!.languageCode);
      return Get.deviceLocale!;
    } else {
      return Locale(myServices.sharedPref.getString("lang")!);
    }
  }

  ThemeData appTheme() {
    if (myServices.sharedPref.getString("lang") == "ar") {
      return arabicTheme;
    } else {
      return englishTheme;
    }
  }
}
