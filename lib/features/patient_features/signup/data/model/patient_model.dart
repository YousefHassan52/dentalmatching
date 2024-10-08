import 'package:shared_preferences/shared_preferences.dart';

class PatientModel {
  final String address;
  final String token;
  final String? profileImage;
  final String? profileImageLink;
  final String fullName;
  final String email;
  final int age;
  final bool gender;
  final String city;
  final String phoneNumber;
  final String role;
  final String userName;

  PatientModel({
    required this.userName,
    required this.address,
    required this.token,
    required this.fullName,
    required this.email,
    required this.age,
    required this.gender,
    required this.city,
    required this.phoneNumber,
    required this.role,
    this.profileImage,
    this.profileImageLink,
  });

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
      address: json['address'],
      userName: json['userName'],
      token: json['token'],
      profileImage: json['profileImage'],
      profileImageLink: json['profileImageLink'],
      fullName: json['fullName'],
      email: json['email'],
      age: json['age'],
      gender: json['gender'],
      city: json['city'],
      phoneNumber: json['phoneNumber'],
      role: json['role'],
    );
  }

  factory PatientModel.fromSharedPref(SharedPreferences sharedPref) {
    return PatientModel(
      address: sharedPref.getString("address")!,
      userName: sharedPref.getString("userName")!,
      token: sharedPref.getString("token")!,
      profileImage: sharedPref.getString("profileImage"),
      profileImageLink: sharedPref.getString("profileImageLink"),
      fullName: sharedPref.getString("fullName")!,
      email: sharedPref.getString("email")!,
      age: sharedPref.getInt("age")!,
      gender: sharedPref.getBool("gender")!,
      city: sharedPref.getString("city")!,
      phoneNumber: sharedPref.getString("phoneNumber")!,
      role: sharedPref.getString("role")!,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'userName': userName,
      'fullName': fullName,
      'email': email,
      'age': age,
      'gender': gender,
      'city': city,
      'phoneNumber': phoneNumber,
    };
  }

  @override
  String toString() {
    return 'PatientModel{'
        'address: $address, '
        'token: $token, '
        'fullName: $fullName, '
        'email: $email, '
        'age: $age, '
        'gender: $gender, '
        'city: $city, '
        'userName: $userName, '
        'phoneNumber: $phoneNumber, '
        'role: $role'
        '}';
  }
}
