import 'package:get/get.dart';

abstract class SettingsPatientControllerAbstract extends GetxController {
  initializeUserData(); // bec you already get it while login and passed it to sharedPref and now you will get it from Sharedpref
  getData();
}
