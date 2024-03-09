import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/features/patient_features/View_Cases/Controller/mycases_patient_controller_impl.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/controller/settings_controller_imp.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/view/Widgets/CounterBox.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/view/Widgets/EnabledInfo.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/view/Widgets/Upper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPatientScreen extends StatelessWidget {
  const SettingsPatientScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsPatientControllerImp controller =
        Get.put(SettingsPatientControllerImp());
    MyCasesPatientControllerImpl myCasesController =
        Get.put(MyCasesPatientControllerImpl());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UpperWidget(),
            Padding(
              padding: EdgeInsets.only(left: 20, top: 25),
              child: FittedBox(
                child: EnabledInfo(
                    icon: Icons.phone_rounded,
                    info: controller.userModel.phoneNumber),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, top: 15),
              child: FittedBox(
                child: EnabledInfo(
                    icon: Icons.mail, info: controller.userModel.email),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: const FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "Log out",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                            color: AppColors.mainColor),
                      ),
                    ),
                  ),
                  Flexible(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: TextButton(
                          onPressed: () {
                            controller.logout();
                          },
                          child: Icon(
                            Icons.logout,
                            color: AppColors.mainColor,
                          )),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
