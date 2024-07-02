// ignore_for_file: unused_local_variable

import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/routes_names.dart';
import 'package:dentalmatching/core/localization/translation_controller.dart';
import 'package:dentalmatching/core/shared/dailogue_with_buttons.dart';
import 'package:dentalmatching/features/common_faetures/delete_account/controller/delete_account_controller_impl.dart';
import 'package:dentalmatching/features/patient_features/view_casess/Controller/mycases_patient_controller_impl.dart';
import 'package:dentalmatching/features/patient_features/patient_data_viewer/pateint_data_controller.dart';
import 'package:dentalmatching/features/patient_features/paybal/controller/payment_contoller_imp.dart';
import 'package:dentalmatching/features/patient_features/payment/controller/payment_contoller_imp.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/controller/settings_controller_imp.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/view/widgets/counter_box.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/view/widgets/enabled_info.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/view/widgets/language_selection.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/view/Widgets/upper.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/view/widgets/setting_row_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPatientScreen extends StatelessWidget {
  const SettingsPatientScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PaybalControllerImp paypalController = Get.put(PaybalControllerImp());
    PaymentControllerImp payment = Get.put(PaymentControllerImp());
    Get.put(PatientDataController());
    SettingsPatientControllerImp settingsPatientControllerImp =
        Get.put(SettingsPatientControllerImp());
    DeleteAccountControllerImp deleteController =
        Get.put(DeleteAccountControllerImp());
    Get.put(MyCasesPatientControllerImpl());
    TranslationController translationController =
        Get.put(TranslationController());
    PatientDataController patientData = Get.put(PatientDataController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: GetBuilder<PatientDataController>(
          builder: (controller) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const UpperWidget(),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: EnabledInfo(
                    icon: Icons.phone_rounded,
                    info: controller.userModel.phoneNumber),
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: EnabledInfo(
                    icon: Icons.mail, info: controller.userModel.email),
              ),
              

              const SizedBox(
                height: 25,
              ),
              const Center(child: CounterBox()),
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
                    Get.toNamed(AppRoutes.editPatientInfo);
                  }),
              SettingsRowComponent(
                  icon: Icons.camera_alt_rounded,
                  iconColor: AppColors.mainColor,
                  text: "Change Profile Image".tr,
                  textColor: AppColors.mainColor,
                  onTap: () {
                    Get.toNamed(AppRoutes.changeProfileImage, arguments: {
                      "role": "patient",
                      "profileImageLink":
                          patientData.userModel.profileImageLink,
                      "token": settingsPatientControllerImp.userModel.token
                    });
                  }),
              SettingsRowComponent(
                  icon: Icons.lock_rounded,
                  iconColor: AppColors.mainColor,
                  text: "Change Password".tr,
                  textColor: AppColors.mainColor,
                  onTap: () {
                    Get.toNamed(AppRoutes.changePassword, arguments: {
                      "token": settingsPatientControllerImp.userModel.token,
                      "email": settingsPatientControllerImp.userModel.email,
                    });
                  }),

              LanguageSelection(
                txt: 'Language',
                txt1: '- Arabic',
                txt2: '- English',
                onPressed: () {
                  settingsPatientControllerImp.trueVisibilityLanguage();
                },
                onPressed1: () {
                  translationController.changeLang(langCode: "ar");
                  settingsPatientControllerImp.trueVisibilityLanguage();
                },
                onPressed2: () {
                  translationController.changeLang(langCode: "en");
                  settingsPatientControllerImp.trueVisibilityLanguage();
                },
              ),

              SettingsRowComponent(
                  icon: Icons.logout,
                  iconColor: AppColors.mainColor,
                  text: "Log out".tr,
                  textColor: AppColors.mainColor,
                  onTap: () {
                    settingsPatientControllerImp.logout();
                  }),
              SettingsRowComponent(
                  icon: Icons.delete_forever,
                  iconColor: const Color.fromARGB(255, 148, 17, 7),
                  text: "Delete Account".tr,
                  textColor: const Color.fromARGB(255, 148, 17, 7),
                  onTap: () {
                    customDialogeWithButtons(
                        title: "Warning".tr,
                        middleText: "delete account middle text".tr,
                        confirm: () {
                          deleteController
                              .deleteAccount(token: controller.userModel.token)
                              .then((value) =>
                                  settingsPatientControllerImp.logout());
                        });
                  }),

              GetBuilder<PaybalControllerImp>(
                builder: (controller) => Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  width: double.infinity,
                  child: controller.requestStatus == RequestStatus.LOADING
                      ? LinearProgressIndicator(
                          color: AppColors.mainColor,
                          backgroundColor:
                              AppColors.mainColor.withOpacity(0.20),
                        )
                      : null,
                ),
              ),
              GetBuilder<PaymentControllerImp>(
                builder: (controller) => Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  width: double.infinity,
                  child: controller.requestStatus == RequestStatus.LOADING
                      ? LinearProgressIndicator(
                          color: AppColors.mainColor,
                          backgroundColor:
                              AppColors.mainColor.withOpacity(0.20),
                        )
                      : null,
                ),
              ),
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
