import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/features/common_faetures/change_password_in_profile/controller/change_password_controller_impl.dart';
import 'package:dentalmatching/features/common_faetures/change_profile_image/controller/change_profile_img_impl_controller.dart';
import 'package:dentalmatching/features/common_faetures/change_profile_image/data/change_profile_img_data.dart';
import 'package:dentalmatching/features/common_faetures/loginn/view/widgets/auth_button.dart';
import 'package:dentalmatching/features/patient_features/patient_data_viewer/pateint_data_controller.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/view/Widgets/circle_avatar_widget.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/view/Widgets/upper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AddProfileImgScreen extends StatelessWidget {
  const AddProfileImgScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PatientDataController patientDataController =
        Get.put(PatientDataController());
    ChangeProfileImageImplController contoller =
        Get.put(ChangeProfileImageImplController());
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UpperWidget(
            needBackButton: true,
            text: 'Change Profile Image        ',
            welcome: false,
          ),
          const SizedBox(
            height: 25,
          ),
          GetBuilder<ChangeProfileImageImplController>(builder: (controller) {
            return Center(
              child: Stack(
                clipBehavior: Clip.antiAlias,
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    clipBehavior: Clip.antiAlias,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(30)),
                    child: controller.imageFile != null
                        ? Image.file(contoller.imageFile!)
                        : patientDataController.userModel.profileImageLink !=
                                null
                            ? Image.network(patientDataController
                                .userModel.profileImageLink!)
                            : Image.asset(
                                "assets/images/profilepicture.png",
                              ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 21,
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.mainColor,
                    child: IconButton(
                        onPressed: () {
                          contoller.pickImage();
                        },
                        icon: const Icon(
                          Icons.camera_alt_rounded,
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
            );
          }),
          const SizedBox(
            height: 15,
          ),
          AuthButton(
              buttonText: "Change Image",
              onTap: () {
                contoller.changeProfileImage(
                    token: patientDataController.userModel.token);
              }),
          GetBuilder<ChangeProfileImageImplController>(
            builder: (controller) => Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              child: controller.requestStatus == RequestStatus.LOADING
                  ? LinearProgressIndicator(
                      color: AppColors.mainColor,
                      backgroundColor: AppColors.mainColor.withOpacity(0.20),
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
