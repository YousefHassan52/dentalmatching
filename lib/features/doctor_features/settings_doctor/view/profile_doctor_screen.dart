import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/View/Widget/AppUpper.dart';
import 'package:dentalmatching/features/doctor_features/get_doctor_cases/controller/get_doctor_cases_controller_impl.dart';
import 'package:dentalmatching/features/doctor_features/settings_doctor/controller/doctor_home_controller_impl.dart';
import 'package:dentalmatching/features/doctor_features/settings_doctor/view/Widgets/counter_box_doctor.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/view/Widgets/EnabledInfo.dart';
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
      body: Column(
        children: [
          const AppUpperWidget(),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 25),
            child: EnabledInfo(
                icon: Icons.phone_rounded,
                info: controller.userModel.phoneNumber),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, top: 15),
            child:
                EnabledInfo(icon: Icons.mail, info: controller.userModel.email),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                const Text(
                  "Log out",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: AppColors.mainColor),
                ),
                const Spacer(),
                TextButton(
                    onPressed: () {
                      controller.logout();
                    },
                    child: const Icon(
                      Icons.logout,
                      color: AppColors.mainColor,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
