import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/features/patient_features/edit_profile_info/controller/edit_patient_info_controller_abstract.dart';
import 'package:dentalmatching/features/patient_features/patient_data/pateint_data_controller.dart';
import 'package:dentalmatching/features/patient_features/signup/data/model/patient_model.dart';
import 'package:get/get.dart';

class EditPatientInfoControllerImp extends EditPatientInfoControllerAbstract {
  MyServices myServices = Get.find();
  late PatientModel userModel =
      PatientModel.fromSharedPref(myServices.sharedPref);
  @override
  Future<void> editPatientInfo() async {
    PateintDataController pateintDataController =
        Get.put(PateintDataController());
    Map<String, dynamic> response = {
      "data": {
        'address': "giza cairo",
        'profileImage': userModel.token,
        'fullName': "seif el dein",
        'email': "seif@mail.com",
        'age': 32,
        'gender': true,
        'city': "city",
        'phoneNumber': "987654321",
        'role': "patient",
      }
    };
    pateintDataController.updatePatientdata(response);

    print(myServices.sharedPref.getString("phoneNumber"));
    print(myServices.sharedPref.getBool("logged"));
    print("--------------------------------------");
    print(userModel.email);
  }
}
