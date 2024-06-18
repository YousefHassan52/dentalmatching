import 'dart:io';

import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/functions/handling_response_type.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/core/shared/dialogue_without_buttons.dart';
import 'package:dentalmatching/features/common_faetures/change_profile_image/controller/change_profile_img_abstract_controller.dart';
import 'package:dentalmatching/features/common_faetures/change_profile_image/data/change_profile_img_data.dart';
import 'package:dentalmatching/features/doctor_features/doctor_data_viewer/doctor_data_controller.dart';
import 'package:dentalmatching/features/doctor_features/signup/data/models/doctor_model.dart';
import 'package:dentalmatching/features/patient_features/patient_data_viewer/pateint_data_controller.dart';
import 'package:dentalmatching/features/patient_features/signup/data/model/patient_model.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ChangeProfileImageImplController
    extends ChangeProfileImageAbstractController {
  File? imageFile;
  MyServices myServices = Get.find();
  late String role;
  late String token;
  String? profileImageLink;

  RequestStatus? requestStatus;
  ChangeProfileImgData data = ChangeProfileImgData(Get.find());
  @override
  void onInit() {
    role = Get.arguments["role"];
    token = Get.arguments["token"];
    profileImageLink = Get.arguments["profileImageLink"];

    super.onInit();
  }

  void pickImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      String filePath = image.path;
      String fileExtension = filePath.split('.').last.toLowerCase();

      // Check if the file extension is png, jpg, or jpeg
      if (fileExtension == 'png' ||
          fileExtension == 'jpg' ||
          fileExtension == 'jpeg') {
        imageFile = File(filePath);
        update(); // Update the UI after selecting an image
      } else {
        customDialoge(
            title: "Wrong Image Format",
            middleText: "make sure that your image file is png, jpg or jpeg");
      }
    }
    update();
  }

  @override
  void changeProfileImage() async {
    if (imageFile != null) {
      requestStatus = RequestStatus.LOADING;
      update();
      var response = await data.postData(
        fileImage: imageFile!,
        token: token,
      );
      requestStatus = HandlingResponseType.fun(response);
      update();
      print("response ya joooe:------ $response");
      if (requestStatus == RequestStatus.SUCCESS) {
        if (response["success"] == true) {
          Get.snackbar("Updated Successfully",
              "Your image has been updatedd successfully");
          if (role == "patient") {
            PatientDataController pateintDataController =
                Get.put(PatientDataController());
            // if success
            pateintDataController.updatePatientProfileImage(response["data"]);
            profileImageLink = response["data"];
            update();
          } else {
            DoctorDataController doctorDataController =
                Get.put(DoctorDataController());
            doctorDataController.updateDoctorProfileImage(response["data"]);
          }
          profileImageLink = response["data"];
          update();
        }
      } else if (requestStatus == RequestStatus.UNAUTHORIZED_FAILURE) {
        customDialoge(title: "Warning".tr, middleText: "Unauthrized Error");
      } else {
        customDialoge(
            title: "Warning".tr, middleText: "Server Error Please Try Again");
      }

      update();
    } else {
      customDialoge(title: "Warning".tr, middleText: "No image selected");
    }
  }
}
