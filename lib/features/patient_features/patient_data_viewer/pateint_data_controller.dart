import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/features/patient_features/signup/data/model/patient_model.dart';
import 'package:get/get.dart';

class PatientDataController extends GetxController {
  MyServices myServices = Get.find();
  late PatientModel userModel =
      PatientModel.fromSharedPref(myServices.sharedPref);
  updatePatientdata(response) {
    myServices.updatePatientModelToSharedPrefrence(response);
    userModel = PatientModel.fromSharedPref(myServices.sharedPref);
    update();
  }

  PatientModel GetPatient() {
    return userModel;
  }
}
