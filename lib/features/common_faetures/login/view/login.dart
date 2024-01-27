import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/core/localization/translation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  LoginControllerImp externalController = Get.put(LoginControllerImp());
    TranslationController translationController =
        Get.put(TranslationController());
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      translationController.changeLang(langCode: "ar");
                    },
                    child: const Text("arabic")),
                SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      translationController.changeLang(langCode: "en");
                    },
                    child: const Text(
                      "english",
                    )),
              ],
            ),
            Text(
              "1".tr,
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w200,
                  fontFamily: "Cairo"),
            ),
            Text(
              "1".tr,
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w300,
                  fontFamily: "Cairo"),
            ),
            Text(
              "1".tr,
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Cairo"),
            ),
            Text(
              "1".tr,
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Cairo"),
            ),
            Text(
              "1".tr,
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Cairo"),
            ),
            Text(
              "1".tr,
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Cairo"),
            ),
            Text(
              "1".tr,
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w800,
                  fontFamily: "Cairo"),
            ),
            Text(
              "1".tr,
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w900,
                  fontFamily: "Cairo"),
            ),
          ],
        ),
      )),
    );
  }
}
