import 'package:dentalmatching/core/constants/routes_names.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/core/shared/dialogue_without_buttons.dart';
import 'package:get/get.dart';

void blockAction() {
  MyServices myServices = Get.find();
  myServices.removeUserFromSharedPref();
  Get.offAllNamed(AppRoutes.login);
  customDialoge(
    title: "Blocked User".tr,
    middleText:
        "You have been blocked by many doctors more than 3 times due to your bad attitude"
            .tr,
  );
}
