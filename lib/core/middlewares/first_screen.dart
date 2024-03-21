import 'package:dentalmatching/core/services/my_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/routes_names.dart';

class FirstScreen extends GetMiddleware {
  MyServices myServices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPref.getBool("logged") == true) {
      // talma d5alna hena fa 2ked el role m4 be null
      if (myServices.sharedPref.getString("role")!.toLowerCase() ==
          "patient".toLowerCase()) {
        return const RouteSettings(name: AppRoutes.homePatient);
      }
      if (myServices.sharedPref.getString("role")!.toLowerCase() ==
          "doctor".toLowerCase()) {
        return const RouteSettings(name: AppRoutes.homeDoctor);
      }
      if (myServices.sharedPref.getString("role")!.toLowerCase() ==
          "AdminDoctor".toLowerCase()) {
        return const RouteSettings(name: AppRoutes.adminDoctorHome);
      }
    }
    if (myServices.sharedPref.getBool("not_first") != null) {
      return const RouteSettings(name: AppRoutes.login);
    }
  }
}
