import 'package:dentalmatching/core/constants/routes_names.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:get/get.dart';

void blockAction() {
  MyServices myServices = Get.find();
  myServices.removeUserFromSharedPref();
  Get.offAllNamed(AppRoutes.login);
  Get.defaultDialog(
    title: "Blocked User",
    middleText:
        "You have been blocked by many doctors more than 3 times due to your bad attitude",
  );
}
