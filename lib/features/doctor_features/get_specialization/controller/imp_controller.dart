// ignore_for_file: avoid_print

import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/functions/handling_response_type.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/core/shared/dialogue_without_buttons.dart';
import 'package:dentalmatching/features/doctor_features/doctor_data_viewer/doctor_data_controller.dart';
import 'package:dentalmatching/features/doctor_features/get_specialization/controller/abstract_controller.dart';
import 'package:dentalmatching/features/doctor_features/get_specialization/data/get_specialization_data.dart';
import 'package:dentalmatching/features/doctor_features/signup/data/models/doctor_model.dart';
import 'package:get/get.dart';

class GetSpecializationControllerImpl
    extends GetSpecializationControllerAbstract {
  MyServices myServices = Get.find();
  late DoctorModel userModel =
      DoctorModel.fromSharedPref(myServices.sharedPref);
  GetSpecializationData data = GetSpecializationData(Get.find());

  RequestStatus? requestStatus;

  @override
  void getSpecialization() async {
    requestStatus = RequestStatus.LOADING;
    update();
    var response = await data.getData(
      token: userModel.token,
    );
    requestStatus = HandlingResponseType.fun(response);
    print("response ya joooe:------ $response");
    // print(response);
    if (requestStatus == RequestStatus.SUCCESS) {
      if (response["success"] == true) {
        DoctorDataController doctorDataController =
            Get.put(DoctorDataController());
        doctorDataController
            .updateDoctorSpecialization(response["data"]["specialization"]);
      }
    } else if (requestStatus == RequestStatus.UNAUTHORIZED_FAILURE) {
      customDialoge(title: "Warning".tr, middleText: "unExpected error");
    } else {
      customDialoge(
          title: "Warning".tr, middleText: "Server Error Please Try Again");
    }

    update();
  }
}
