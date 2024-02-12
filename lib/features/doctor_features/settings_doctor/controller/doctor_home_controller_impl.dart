import 'package:dentalmatching/core/constants/routes_names.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/features/doctor_features/settings_doctor/controller/doctor_home_controller_abstract%20copy.dart';
import 'package:dentalmatching/features/doctor_features/signup/data/models/doctor_model.dart';
import 'package:get/get.dart';

class SettingsDoctorControllerImpl extends SettingsDoctorControllerAbstract {
  MyServices myServices = Get.find();
  late DoctorModel userModel;

  initializeUserData() {
    userModel = DoctorModel.fromSharedPref(myServices.sharedPref);
  }

  @override
  void onInit() {
    initializeUserData();
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

    myServices.sharedPref.remove("logged");
    Get.offAllNamed(AppRoutes.login);
  }
}
