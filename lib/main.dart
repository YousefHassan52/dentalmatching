// ignore_for_file: avoid_print

import 'package:dentalmatching/core/bindings/initialBinding.dart';
import 'package:dentalmatching/core/constants/themes.dart';
import 'package:dentalmatching/core/localization/translation.dart';
import 'package:dentalmatching/core/localization/translation_controller.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:device_preview/device_preview.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
// );
// var token = await FirebaseMessaging.instance.getToken();
// print("el token ahooo :$token");

  runApp(DevicePreview(builder: (builder) => const MyApp()));
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TranslationController translationController =
        Get.put(TranslationController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: mainAppTheme,
      translations: MyTranslation(),
      getPages: routes,
      locale: translationController.getCurrentLocale(),
      initialBinding: InitialBindings(),
    );
  }
}
