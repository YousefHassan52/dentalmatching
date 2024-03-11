import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPref;

  RxInt casesCounter = 0.obs;

  Future<MyServices> init() async {
    sharedPref = await SharedPreferences.getInstance();
    casesCounter.value = sharedPref.getInt('casesCounter') ?? 0;
    return this;
  }

  AddedCase() {
    casesCounter.value++;
    sharedPref.setInt("casesCounter", casesCounter.value);
  }

  Resest() {
    casesCounter.value = 0;
    sharedPref.setInt("casesCounter", casesCounter.value);
  }

  void saveDoctorModelToSharedPrefrence(response) {
    sharedPref.setBool("logged", true);
    sharedPref.setString("userName", response["data"]["userName"]);

    sharedPref.setString("university", response["data"]["university"]);
    sharedPref.setString("cardImage", response["data"]["cardImage"] ?? '');
    sharedPref.setString("token", response["data"]["token"]);
    sharedPref.setString(
        "profileImage", response["data"]["profileImage"] ?? '');
    sharedPref.setString("fullName", response["data"]["fullName"]);
    sharedPref.setString("email", response["data"]["email"]);
    sharedPref.setInt("age", response["data"]["age"]);
    sharedPref.setBool("gender", response["data"]["gender"]);
    sharedPref.setString("city", response["data"]["city"]);
    sharedPref.setString("phoneNumber", response["data"]["phoneNumber"]);
    sharedPref.setString("role", response["data"]["role"]);
  }

  void savePatientModelToSharedPrefrence(response) {
    sharedPref.setBool("logged", true);
    sharedPref.setString("address", response["data"]["address"]);
    sharedPref.setString("userName", response["data"]["userName"]);
    sharedPref.setString("token", response["data"]["token"]);
    sharedPref.setString(
        "profileImage", response["data"]["profileImage"] ?? '');
    sharedPref.setString("fullName", response["data"]["fullName"]);
    sharedPref.setString("email", response["data"]["email"]);
    sharedPref.setInt("age", response["data"]["age"]);
    sharedPref.setBool("gender", response["data"]["gender"]);
    sharedPref.setString("city", response["data"]["city"]);
    sharedPref.setString("phoneNumber", response["data"]["phoneNumber"]);
    sharedPref.setString("role", response["data"]["role"]);
  }

  void updatePatientModelToSharedPrefrence(response) {
    sharedPref.setString("userName", response["userName"]);

    sharedPref.setString("address", response["address"]);
    sharedPref.setString("fullName", response["fullName"]);
    sharedPref.setString("email", response["email"]);
    sharedPref.setInt("age", response["age"]);
    sharedPref.setBool("gender", response["gender"]);
    sharedPref.setString("city", response["city"]);
    sharedPref.setString("phoneNumber", response["phoneNumber"]);
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
