import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/features/common_faetures/delete_account/controller/delete_account_controller_impl.dart';
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
    DeleteAccountControllerImp deleteController =
        Get.put(DeleteAccountControllerImp());
    MyCasesPatientControllerImpl myCasesController =
        Get.put(MyCasesPatientControllerImpl());
    return Scaffold(
      backgroundColor: Colors.white,
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
            SettingsRowComponent(
                icon: Icons.logout,
                iconColor: AppColors.mainColor,
                text: "Log out",
                textColor: AppColors.mainColor,
                onTap: () {
                  controller.logout();
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
                          .then((value) => controller.logout());
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

class SettingsRowComponent extends StatelessWidget {
  const SettingsRowComponent({
    super.key,
    required this.onTap,
    required this.text,
    required this.icon,
    required this.textColor,
    required this.iconColor,
  });

  final void Function() onTap;
  final String text;
  final IconData icon;
  final Color textColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: textColor),
              ),
            ),
          ),
          Flexible(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: TextButton(
                  onPressed: onTap,
                  child: Icon(
                    icon,
                    color: iconColor,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
