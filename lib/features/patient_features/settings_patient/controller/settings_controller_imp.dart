import 'package:dentalmatching/core/constants/routes_names.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/controller/settings_controller_abstract.dart';
import 'package:dentalmatching/features/patient_features/signup/data/model/patient_model.dart';
import 'package:get/get.dart';

class SettingsPatientControllerImp extends SettingsPatientControllerAbstract {
  MyServices myServices = Get.find();
  late PatientModel userModel =
      PatientModel.fromSharedPref(myServices.sharedPref);

  @override
  initializeUserData() {
    getData();
  }

  @override
  void onInit() {
    initializeUserData();
    super.onInit();
  }

  @override
  void getData() async {}

  logout() {
    myServices.sharedPref.remove("address");
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
