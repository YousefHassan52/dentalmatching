import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/routes_names.dart';
import 'package:dentalmatching/core/localization/translation_controller.dart';
import 'package:dentalmatching/features/common_faetures/delete_account/controller/delete_account_controller_impl.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/View/Widget/app_upper.dart';
import 'package:dentalmatching/features/doctor_features/doctor_data_viewer/doctor_data_controller.dart';
import 'package:dentalmatching/features/doctor_features/get_doctor_cases/controller/get_doctor_cases_controller_impl.dart';
import 'package:dentalmatching/features/doctor_features/settings_doctor/controller/doctor_settings_controller_impl.dart';
import 'package:dentalmatching/features/doctor_features/settings_doctor/view/Widgets/language_dr_selection.dart';
import 'package:dentalmatching/features/doctor_features/settings_doctor/view/Widgets/counter_box_doctor.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/view/Widgets/enabled_info.dart';
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
              FittedBox(
                fit: BoxFit.scaleDown,
                child: EnabledInfo(
                    icon: Icons.phone_rounded,
                    info: controller.doctorModel.phoneNumber),
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: EnabledInfo(
                    icon: Icons.mail, info: controller.doctorModel.email),
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
                  text: "Edit Profile Info".tr,
                  textColor: AppColors.mainColor,
                  onTap: () {
                    Get.toNamed(AppRoutes.editDoctorInfo);
                  }),
              SettingsRowComponent(
                  icon: Icons.lock_rounded,
                  iconColor: AppColors.mainColor,
                  text: "Change Password".tr,
                  textColor: AppColors.mainColor,
                  onTap: () {
                    Get.toNamed(AppRoutes.changePassword, arguments: {
                      "token": settingsController.userModel.token,
                      "email": settingsController.userModel.email,
                    });
                  }),
              LanguageDrSelection(
                txt: 'Language',
                txt1: '- Arabic',
                txt2: '- English',
                onPressed: () {
                  settingsController.trueVisibilityLanguage();
                },
                onPressed1: () {
                  translationController.changeLang(langCode: "ar");
                  settingsController.trueVisibilityLanguage();
                },
                onPressed2: () {
                  translationController.changeLang(langCode: "en");
                  settingsController.trueVisibilityLanguage();
                },
              ),
              SettingsRowComponent(
                  icon: Icons.logout,
                  iconColor: AppColors.mainColor,
                  text: "Log out".tr,
                  textColor: AppColors.mainColor,
                  onTap: () {
                    settingsController.logout();
                  }),
              SettingsRowComponent(
                  icon: Icons.delete_forever,
                  iconColor: const Color.fromARGB(255, 148, 17, 7),
                  text: "Delete Account".tr,
                  textColor: const Color.fromARGB(255, 148, 17, 7),
                  onTap: () {
                    Get.defaultDialog(
                      title: "Warning".tr,
                      middleText: "delete account middle text".tr,
                      confirm: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.red, // Change color to red
                          ),
                        ),
                        onPressed: () {
                          deleteController
                              .deleteAccount(
                                  token: controller.doctorModel.token)
                              .then((value) => settingsController.logout());
                        },
                        child: Text(
                          "Confirm".tr,
                          style: const TextStyle(
                            color: Colors.white,
                          ), // Translate "Confirm" into Arabic
                        ),
                      ),
                      cancel: ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          "Cancel".tr,
                          style: const TextStyle(
                            color: Colors.black,
                          ), // Translate "Confirm" into Arabic
                        ),
                      ),
                      onCancel: () {},
                    );
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
