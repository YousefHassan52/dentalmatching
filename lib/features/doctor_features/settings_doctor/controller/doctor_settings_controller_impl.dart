// ignore_for_file: unnecessary_overrides

import 'package:dentalmatching/core/constants/routes_names.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/features/doctor_features/settings_doctor/controller/doctor_settings_controller_abstract.dart';
import 'package:dentalmatching/features/doctor_features/signup/data/models/doctor_model.dart';
import 'package:get/get.dart';

class SettingsDoctorControllerImpl extends SettingsDoctorControllerAbstract {
  MyServices myServices = Get.find();
  late DoctorModel userModel =
      DoctorModel.fromSharedPref(myServices.sharedPref);

  RxBool visibleLanguage = false.obs;
  RxBool visiblePay = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  void logout() {
    myServices.sharedPref.remove("university");
    myServices.sharedPref.remove("cardImage");
    myServices.sharedPref.remove("token");
    myServices.sharedPref.remove("profileImage");
    myServices.sharedPref.remove("fullName");
    myServices.sharedPref.remove("email");
    myServices.sharedPref.remove("age");
    myServices.sharedPref.remove("gender");
    myServices.sharedPref.remove("city");
    myServices.sharedPref.remove("phoneNumber");
    myServices.sharedPref.remove("role");
    myServices.sharedPref.remove("specialization");
    myServices.sharedPref.remove("userName");

    myServices.sharedPref.remove("logged");
    Get.offAllNamed(AppRoutes.login);
  }

  void trueVisibilityLanguage() {
    visibleLanguage.toggle();
    update();
  }

  void trueVisibilityPay() {
    visiblePay.toggle();
    update();
  }
}
