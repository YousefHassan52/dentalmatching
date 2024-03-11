import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/features/doctor_features/signup/data/models/doctor_model.dart';
import 'package:get/get.dart';

class DoctorDataController extends GetxController {
  MyServices myServices = Get.find();
  late DoctorModel userModel =
      DoctorModel.fromSharedPref(myServices.sharedPref);
  updateDoctordata(response) {
    myServices.updateDoctorModelToSharedPrefrence(response);
    userModel = DoctorModel.fromSharedPref(myServices.sharedPref);
    update();
  }
}
