import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/routes_names.dart';
import 'package:dentalmatching/core/localization/translation_controller.dart';
import 'package:dentalmatching/features/common_faetures/delete_account/controller/delete_account_controller_impl.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/View/Widget/AppUpper.dart';
import 'package:dentalmatching/features/doctor_features/doctor_data_viewer/doctor_data_controller.dart';
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
    SettingsDoctorControllerImpl settingsController =
        Get.put(SettingsDoctorControllerImpl());

    Get.put(GetDocotorCasesControllerImpl());
    Get.put(DoctorDataController());
    DeleteAccountControllerImp deleteController =
        Get.put(DeleteAccountControllerImp());
    TranslationController translationController =
        Get.put(TranslationController());

    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<DoctorDataController>(
          builder: (controller) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppUpperWidget(),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 25),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: EnabledInfo(
                      icon: Icons.phone_rounded,
                      info: controller.doctorModel.phoneNumber),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 15),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Row(
                    children: [
                      const Icon(
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
                            controller.doctorModel.email,
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
                    Get.toNamed(AppRoutes.editDoctorInfo);
                  }),
              SettingsRowComponent(
                  icon: Icons.logout,
                  iconColor: AppColors.mainColor,
                  text: "Log out",
                  textColor: AppColors.mainColor,
                  onTap: () {
                    settingsController.logout();
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
                        deleteController
                            .deleteAccount(token: controller.doctorModel.token)
                            .then((value) => settingsController.logout());
                      },
                      onCancel: () {},
                      textConfirm: "Delete",
                    );
                  }),
              SettingsRowComponent(
                  icon: Icons.language_rounded,
                  iconColor: const Color.fromARGB(255, 7, 39, 179),
                  text: "Language".tr,
                  textColor: const Color.fromARGB(255, 7, 39, 179),
                  onTap: () {
                    translationController.changeLang(langCode: "en");
                  }),
              SettingsRowComponent(
                  icon: Icons.language_rounded,
                  iconColor: const Color.fromARGB(255, 7, 39, 179),
                  text: "arabic",
                  textColor: const Color.fromARGB(255, 7, 39, 179),
                  onTap: () {
                    translationController.changeLang(langCode: "ar");
                  }),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
