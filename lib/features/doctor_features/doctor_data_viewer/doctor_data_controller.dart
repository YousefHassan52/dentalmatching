import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/features/doctor_features/signup/data/models/doctor_model.dart';
import 'package:get/get.dart';

class DoctorDataController extends GetxController {
  MyServices myServices = Get.find();
  late DoctorModel doctorModel =
      DoctorModel.fromSharedPref(myServices.sharedPref);
  updateDoctordata(response) {
    myServices.updateDoctorModelToSharedPrefrence(response);
    doctorModel = DoctorModel.fromSharedPref(myServices.sharedPref);
    update();
  }

  updateDoctorProfileImage(imageLink) {
    myServices.updateProfileImage(imageLink);
    doctorModel = DoctorModel.fromSharedPref(myServices.sharedPref);
    update();
  }

  updateDoctorSpecialization(specialization) {
    myServices.updateDoctorSpecialization(specialization);
    doctorModel = DoctorModel.fromSharedPref(myServices
        .sharedPref); // dh el doctor model el ba listen 3leh fe el widgets belzat fe el upper widgets
    update();
  }
}
