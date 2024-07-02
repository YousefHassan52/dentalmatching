import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/routes_names.dart';
import 'package:dentalmatching/core/localization/translation_controller.dart';
import 'package:dentalmatching/core/shared/dailogue_with_buttons.dart';
import 'package:dentalmatching/features/common_faetures/delete_account/controller/delete_account_controller_impl.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/View/Widget/app_upper.dart';
import 'package:dentalmatching/features/doctor_features/doctor_data_viewer/doctor_data_controller.dart';
import 'package:dentalmatching/features/doctor_features/get_doctor_cases/controller/get_doctor_cases_controller_impl.dart';
import 'package:dentalmatching/features/doctor_features/get_specialization/controller/imp_controller.dart';
import 'package:dentalmatching/features/doctor_features/settings_doctor/controller/doctor_settings_controller_impl.dart';
import 'package:dentalmatching/features/doctor_features/settings_doctor/view/widgets/language_dr_selection.dart';
import 'package:dentalmatching/features/doctor_features/settings_doctor/view/widgets/counter_box_doctor.dart';
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
    DoctorDataController doctorData = Get.put(DoctorDataController());
    Get.put(GetSpecializationControllerImpl());

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
              GetBuilder<GetSpecializationControllerImpl>(
                  builder: (specializationController) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: EnabledInfo(
                          icon: Icons.add_task,
                          info:
                              "Specialization: ${controller.doctorModel.specialization}"),
                    ),
                    Flexible(
                      child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: specializationController.requestStatus ==
                                    RequestStatus.LOADING
                                ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      backgroundColor: AppColors.circleColor,
                                      color: AppColors.mainColor,
                                    ),
                                  )
                                : IconButton(
                                    onPressed: () {
                                      specializationController.getSpecialization();
                                    },
                                    icon: const Icon(
                                      Icons.autorenew,
                                      color: AppColors.mainColor,
                                    )),
                          )),
                    )
                  ],
                );
              }),
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
                  icon: Icons.add_task,
                  iconColor: AppColors.mainColor,
                  text: "Change Specialization".tr,
                  textColor: AppColors.mainColor,
                  onTap: () {
                    Get.toNamed(
                      AppRoutes.editSpecializationScreen,
                    );
                  }),
              SettingsRowComponent(
                  icon: Icons.camera_alt_rounded,
                  iconColor: AppColors.mainColor,
                  text: "Change Profile Image".tr,
                  textColor: AppColors.mainColor,
                  onTap: () {
                    Get.toNamed(AppRoutes.changeProfileImage, arguments: {
                      "role": "doctor",
                      "profileImageLink":
                          doctorData.doctorModel.profileImageLink,
                      "token": settingsController.userModel.token
                    });
                    //Get.toNamed(AppRoutes.resetPassword, arguments: {"email": email});
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
                    customDialogeWithButtons(
                      title: "Warning".tr,
                      middleText: "delete account middle text".tr,
                      confirm: () {
                        deleteController
                            .deleteAccount(token: controller.doctorModel.token)
                            .then((value) => settingsController.logout());
                      },
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
