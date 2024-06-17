import 'package:dentalmatching/core/constants/routes_names.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/controller/settings_controller_abstract.dart';
import 'package:dentalmatching/features/patient_features/signup/data/model/patient_model.dart';
import 'package:get/get.dart';

class SettingsPatientControllerImp extends SettingsPatientControllerAbstract {
  MyServices myServices = Get.find();
  late PatientModel userModel =
      PatientModel.fromSharedPref(myServices.sharedPref);
  RxBool visibleLanguage = false.obs;
  RxBool visiblePay = false.obs;
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
  void getData() async {
    // some actions
  }
  @override
  logout() {
    myServices.sharedPref.remove("address");
    myServices.sharedPref.remove("token");
    myServices.sharedPref.remove("profileImage");
    myServices.sharedPref.remove("profileImageLink");
    myServices.sharedPref.remove("fullName");
    myServices.sharedPref.remove("email");
    myServices.sharedPref.remove("age");
    myServices.sharedPref.remove("gender");
    myServices.sharedPref.remove("city");
    myServices.sharedPref.remove("phoneNumber");
    myServices.sharedPref.remove("role");
    myServices.sharedPref.remove("userName");

    myServices.sharedPref.remove("logged");
    Get.offAllNamed(AppRoutes.login);
  }

  @override
  deleteAccount() {}

  void trueVisibilityLanguage() {
    visibleLanguage.toggle();
    update();
  }

  void trueVisibilityPay() {
    visiblePay.toggle();
    update();
  }
}
