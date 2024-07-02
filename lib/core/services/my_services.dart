// ignore_for_file: non_constant_identifier_names

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
    if (response["data"]["profileImageLink"] != null) {
      sharedPref.setString(
          "profileImageLink", response["data"]["profileImageLink"]);
    }
    sharedPref.setString("fullName", response["data"]["fullName"]);
    sharedPref.setString("email", response["data"]["email"]);
    sharedPref.setInt("age", response["data"]["age"]);
    sharedPref.setBool("gender", response["data"]["gender"]);
    sharedPref.setString("city", response["data"]["city"]);
    sharedPref.setString("phoneNumber", response["data"]["phoneNumber"]);
    sharedPref.setString("role", response["data"]["role"]);
    sharedPref.setString("specialization", response["data"]["specialization"]);
  }

  void savePatientModelToSharedPrefrence(response) {
    sharedPref.setBool("logged", true);
    sharedPref.setString("address", response["data"]["address"]);
    sharedPref.setString("userName", response["data"]["userName"]);
    sharedPref.setString("token", response["data"]["token"]);
    sharedPref.setString(
        "profileImage", response["data"]["profileImage"] ?? '');
    if (response["data"]["profileImageLink"] != null) {
      sharedPref.setString(
          "profileImageLink", response["data"]["profileImageLink"]);
    }
    sharedPref.setString("fullName", response["data"]["fullName"]);
    sharedPref.setString("email", response["data"]["email"]);
    sharedPref.setInt("age", response["data"]["age"]);
    sharedPref.setBool("gender", response["data"]["gender"]);
    sharedPref.setString("city", response["data"]["city"]);
    sharedPref.setString("phoneNumber", response["data"]["phoneNumber"]);
    sharedPref.setString("role", response["data"]["role"]);
  }

  void saveAdminDoctorModelToSharedPrefrence(response) {
    sharedPref.setBool("logged", true);
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

  void removeUserFromSharedPref() {
    sharedPref.remove("logged");
    sharedPref.remove("userName");
    sharedPref.remove("token");
    sharedPref.remove("profileImage");
    sharedPref.remove("profileImageLink");
    sharedPref.remove("fullName");
    sharedPref.remove("email");
    sharedPref.remove("age");
    sharedPref.remove("gender");
    sharedPref.remove("city");
    sharedPref.remove("phoneNumber");
    sharedPref.remove("role");
    sharedPref.remove("specialization");
    sharedPref.remove("address");
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

  void updateDoctorModelToSharedPrefrence(response) {
    sharedPref.setString("userName", response["userName"]);
    sharedPref.setString("university", response["university"]);
    sharedPref.setString("fullName", response["fullName"]);
    sharedPref.setString("email", response["email"]);
    sharedPref.setInt("age", response["age"]);
    sharedPref.setBool("gender", response["gender"]);
    sharedPref.setString("city", response["city"]);
    sharedPref.setString("phoneNumber", response["phoneNumber"]);
  }

  void updateProfileImage(String imageLink) {
    sharedPref.setString("profileImageLink", imageLink);
  }

  void updateDoctorSpecialization(String specialization) {
    sharedPref.setString("specialization", specialization);
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
