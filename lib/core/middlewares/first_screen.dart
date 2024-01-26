import 'package:dentalmatching/core/services/my_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/routes_names.dart';

class FirstScreen extends GetMiddleware {
  MyServices myServices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPref.getBool("not_first") != null) {
      return const RouteSettings(name: AppRoutes.login);
    }
  }
}
