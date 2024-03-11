import 'package:shared_preferences/shared_preferences.dart';

class DoctorModel {
  final String university;
  final String? cardImage;
  final String token;
  final String? profileImage;
  final String fullName;
  final String email;
  final int age;
  final bool gender;
  final String city;
  final String phoneNumber;
  final String role;
  final String userName;

  DoctorModel({
    required this.university,
    required this.token,
    required this.fullName,
    required this.email,
    required this.age,
    required this.gender,
    required this.city,
    required this.phoneNumber,
    required this.role,
    required this.userName,
    this.cardImage,
    this.profileImage,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      userName: json['userName'],
      university: json['university'],
      cardImage: json['cardImage'],
      token: json['token'],
      profileImage: json['profileImage'],
      fullName: json['fullName'],
      email: json['email'],
      age: json['age'],
      gender: json['gender'],
      city: json['city'],
      phoneNumber: json['phoneNumber'],
      role: json['role'],
    );
  }

  factory DoctorModel.fromSharedPref(SharedPreferences sharedPref) {
    return DoctorModel(
      university: sharedPref.getString("university")!,
      cardImage: sharedPref.getString("cardImage"),
      token: sharedPref.getString("token")!,
      profileImage: sharedPref.getString("profileImage"),
      fullName: sharedPref.getString("fullName")!,
      email: sharedPref.getString("email")!,
      age: sharedPref.getInt("age")!,
      gender: sharedPref.getBool("gender")!,
      city: sharedPref.getString("city")!,
      phoneNumber: sharedPref.getString("phoneNumber")!,
      role: sharedPref.getString("role")!,
      userName: sharedPref.getString("userName")!,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'university': university,
      'cardImage': cardImage,
      'token': token,
      'profileImage': profileImage,
      'fullName': fullName,
      'email': email,
      'age': age,
      'gender': gender,
      'city': city,
      'phoneNumber': phoneNumber,
      'role': role,
      'userName': userName,
    };
  }
}
