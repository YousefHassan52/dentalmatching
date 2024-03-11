import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/View/Widget/AppUpper.dart';
import 'package:dentalmatching/features/doctor_features/get_doctor_cases/controller/get_doctor_cases_controller_impl.dart';
import 'package:dentalmatching/features/doctor_features/settings_doctor/controller/doctor_settings_controller_impl.dart';
import 'package:dentalmatching/features/doctor_features/settings_doctor/view/Widgets/counter_box_doctor.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/view/Widgets/EnabledInfo.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/view/Widgets/setting_row_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsDoctorScreen extends StatelessWidget {
  const SettingsDoctorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsDoctorControllerImpl controller =
        Get.put(SettingsDoctorControllerImpl());
    GetDocotorCasesControllerImpl casesController =
        Get.put(GetDocotorCasesControllerImpl());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppUpperWidget(),
            Padding(
              padding: EdgeInsets.only(left: 20, top: 25),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: EnabledInfo(
                    icon: Icons.phone_rounded,
                    info: controller.userModel.phoneNumber),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, top: 15),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  children: [
                    Icon(
                      Icons.mail,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 200,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          controller.userModel.email,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const CounterBoxDoctor(),
            // InkWell(
            //   child: Text('Settings',style: TextStyle(color: AppColors.blueLightTextColor),),
            // )
            const SizedBox(
              height: 25,
            ),
            SettingsRowComponent(
                icon: Icons.edit,
                iconColor: AppColors.mainColor,
                text: "Edit Profile Info",
                textColor: AppColors.mainColor,
                onTap: () {
                  // Get.toNamed(AppRoutes.editPatientInfo);
                }),
            SettingsRowComponent(
                icon: Icons.logout,
                iconColor: AppColors.mainColor,
                text: "Log out",
                textColor: AppColors.mainColor,
                onTap: () {
                  // settingsPatientControllerImp.logout();
                }),
            SettingsRowComponent(
                icon: Icons.delete_forever,
                iconColor: const Color.fromARGB(255, 148, 17, 7),
                text: "Delete Account",
                textColor: const Color.fromARGB(255, 148, 17, 7),
                onTap: () {
                  Get.defaultDialog(
                    backgroundColor: Colors.white,
                    onConfirm: () {
                      // deleteController
                      //     .deleteAccount(token: controller.userModel.token)
                      //     .then((value) =>
                      //         settingsPatientControllerImp.logout());
                    },
                    onCancel: () {},
                    textConfirm: "Delete",
                  );
                }),
          ],
        ),
      ),
    );
  }
}
