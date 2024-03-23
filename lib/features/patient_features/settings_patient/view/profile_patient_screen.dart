import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/routes_names.dart';
import 'package:dentalmatching/core/localization/translation_controller.dart';
import 'package:dentalmatching/features/common_faetures/delete_account/controller/delete_account_controller_impl.dart';
import 'package:dentalmatching/features/patient_features/View_Cases/Controller/mycases_patient_controller_impl.dart';
import 'package:dentalmatching/features/patient_features/patient_data_viewer/pateint_data_controller.dart';
import 'package:dentalmatching/features/patient_features/paybal/controller/payment_contoller_imp.dart';
import 'package:dentalmatching/features/patient_features/payment/controller/payment_contoller_imp.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/controller/settings_controller_imp.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/view/Widgets/CounterBox.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/view/Widgets/EnabledInfo.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/view/Widgets/LanguageSelection.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/view/Widgets/PaySelection.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/view/Widgets/Upper.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/view/Widgets/setting_row_component.dart';
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

              // SettingsRowComponent(
              //     icon: Icons.language_rounded,
              //     iconColor: const Color.fromARGB(255, 7, 39, 179),
              //     text: "Language".tr,
              //     textColor: const Color.fromARGB(255, 7, 39, 179),
              //     onTap: () {
              //       translationController.changeLang(langCode: "en");
              //     }),
              // SettingsRowComponent(
              //     icon: Icons.language_rounded,
              //     iconColor: const Color.fromARGB(255, 7, 39, 179),
              //     text: "arabic",
              //     textColor: const Color.fromARGB(255, 7, 39, 179),
              //     onTap: () {
              //       translationController.changeLang(langCode: "ar");
              //     }),
              LanguageSelection(
                txt: 'Language',
                txt1: '- Arabic',
                txt2: '- English',
                onPressed: () {
                  settingsPatientControllerImp.trueVisibilityLanguage();
                },
                onPressed1: () {
                  translationController.changeLang(langCode: "ar");
                },
                onPressed2: () {
                  translationController.changeLang(langCode: "en");
                },
              ),
              PaySelection(
                txt: 'Pay',
                txt1: '- PayPal',
                txt2: '- PayMob',
                onPressed: () {
                  settingsPatientControllerImp.trueVisibilityPay();
                },
                onPressed1: () {
                  paypalController.makePayment();
                },
                onPressed2: () {
                  
                   payment.makePayment();
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
                    Get.defaultDialog(
                        backgroundColor: Colors.white,
                        middleText: "Are you sure you want to delete your Acoount?".tr,
                        title: 'Alert'.tr,
                        onConfirm: () {
                          deleteController
                              .deleteAccount(token: controller.userModel.token)
                              .then((value) =>
                                  settingsPatientControllerImp.logout());
                        },
                        onCancel: () {},
                        textConfirm: "Delete".tr,
                        textCancel: "Cancel".tr);
                  }),
              // SettingsRowComponent(
              //     icon: Icons.payment,
              //     iconColor: const Color.fromARGB(255, 1, 100, 75),
              //     text: "Paymob".tr,
              //     textColor: const Color.fromARGB(255, 1, 100, 75),
              //     onTap: () {
              //       payment.makePayment();
              //     }),
              // SettingsRowComponent(
              //     icon: Icons.paypal,
              //     iconColor: const Color.fromARGB(255, 1, 100, 75),
              //     text: "PayPal".tr,
              //     textColor: const Color.fromARGB(255, 1, 100, 75),
              //     onTap: () {
              //       paypalController.makePayment();
              //     }),
              // MaterialButton(
              //   onPressed: () {
              //     visible = true;
              //   },
              //   child: const Row(
              //     children: [
              //       Flexible(
              //         child: FittedBox(
              //           fit: BoxFit.scaleDown,
              //           child: Text(
              //             'Language',
              //             style: TextStyle(
              //                 fontSize: 24,
              //                 fontWeight: FontWeight.w400,
              //                 color: AppColors.blueLightTextColor),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // if (visible == true)
              //   MaterialButton(
              //     onPressed: () {
              //       // visible = true;
              //     },
              //     child: const Column(
              //       children: [
              //         FittedBox(
              //           fit: BoxFit.scaleDown,
              //           child: Text(
              //             'Arabic',
              //             style: TextStyle(
              //                 fontSize: 24,
              //                 fontWeight: FontWeight.w400,
              //                 color: AppColors.blueLightTextColor),
              //           ),
              //         ),
              //         FittedBox(
              //           fit: BoxFit.scaleDown,
              //           child: Text(
              //             'English',
              //             style: TextStyle(
              //                 fontSize: 24,
              //                 fontWeight: FontWeight.w400,
              //                 color: AppColors.blueLightTextColor),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),

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
