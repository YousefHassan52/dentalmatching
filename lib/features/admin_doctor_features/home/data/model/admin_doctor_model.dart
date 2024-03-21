import 'package:shared_preferences/shared_preferences.dart';

class AdminDoctorModel {
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

  AdminDoctorModel({
    required this.userName,
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

  factory AdminDoctorModel.fromJson(Map<String, dynamic> json) {
    return AdminDoctorModel(
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
      userName: json['userName'],
    );
  }

  factory AdminDoctorModel.fromSharedPref(SharedPreferences sharedPref) {
    return AdminDoctorModel(
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
      userName: sharedPref.getString("userName")!,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'profileImage': profileImage,
      'profileImageLink': profileImageLink,
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

  @override
  String toString() {
    return 'AdminDoctorModel{'
        'token: $token, '
        'profileImage: $profileImage, '
        'profileImageLink: $profileImageLink, '
        'fullName: $fullName, '
        'email: $email, '
        'age: $age, '
        'gender: $gender, '
        'city: $city, '
        'phoneNumber: $phoneNumber, '
        'role: $role, '
        'userName: $userName'
        '}';
  }
}
