import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/routes_names.dart';
import 'package:dentalmatching/features/common_faetures/delete_account/controller/delete_account_controller_impl.dart';
import 'package:dentalmatching/features/patient_features/View_Cases/Controller/mycases_patient_controller_impl.dart';
import 'package:dentalmatching/features/patient_features/patient_data_viewer/pateint_data_controller.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/controller/settings_controller_imp.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/view/Widgets/CounterBox.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/view/Widgets/EnabledInfo.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/view/Widgets/Upper.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/view/Widgets/setting_row_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPatientScreen extends StatelessWidget {
  const SettingsPatientScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PatientDataController pateintDataController =
        Get.put(PatientDataController());
    SettingsPatientControllerImp settingsPatientControllerImp =
        Get.put(SettingsPatientControllerImp());
    DeleteAccountControllerImp deleteController =
        Get.put(DeleteAccountControllerImp());
    MyCasesPatientControllerImpl myCasesController =
        Get.put(MyCasesPatientControllerImpl());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: GetBuilder<PatientDataController>(
          builder: (controller) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UpperWidget(),
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
                              ))),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Center(child: const CounterBox()),
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
                    Get.toNamed(AppRoutes.editPatientInfo);
                  }),
              SettingsRowComponent(
                  icon: Icons.logout,
                  iconColor: AppColors.mainColor,
                  text: "Log out",
                  textColor: AppColors.mainColor,
                  onTap: () {
                    settingsPatientControllerImp.logout();
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
                            .deleteAccount(token: controller.userModel.token)
                            .then((value) =>
                                settingsPatientControllerImp.logout());
                      },
                      onCancel: () {},
                      textConfirm: "Delete",
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
