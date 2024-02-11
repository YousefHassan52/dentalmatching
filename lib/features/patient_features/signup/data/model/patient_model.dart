import 'package:shared_preferences/shared_preferences.dart';

class PatientModel {
  final String address;
  final String token;
  final String? profileImage;
  final String fullName;
  final String email;
  final int age;
  final bool gender;
  final String city;
  final String phoneNumber;
  final String role;

  PatientModel({
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
  });

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
      address: json['address'],
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

  factory PatientModel.fromSharedPref(SharedPreferences sharedPref) {
    return PatientModel(
      address: sharedPref.getString("address")!,
      token: sharedPref.getString("token")!,
      profileImage: sharedPref.getString("profileImage"),
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
      'token': token,
      'profileImage': profileImage,
      'fullName': fullName,
      'email': email,
      'age': age,
      'gender': gender,
      'city': city,
      'phoneNumber': phoneNumber,
      'role': role,
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
        'phoneNumber: $phoneNumber, '
        'role: $role'
        '}';
  }
}
