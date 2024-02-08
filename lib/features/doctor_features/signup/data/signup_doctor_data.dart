import 'dart:io';

import 'package:dentalmatching/core/class/crud.dart';
import 'package:dentalmatching/core/constants/api_links.dart';

class SignupDoctorData {
  final CRUD crud;

  SignupDoctorData(this.crud);
  postData({
    required String fullname,
    required String email,
    required String password,
    required int age,
    required bool gender,
    required String city,
    required String phoneNumber,
    required String role,
    required String university,
    required File fileImage,
  }) async {
    var response = await crud
        .postWithImage(image: fileImage, url: ApiLinks.signupDoctor, data: {
      "fullName": fullname,
      "email": email,
      "password": password,
      "age": age,
      "gender": gender,
      "city": city,
      "phoneNumber": phoneNumber,
      "role": role,
      "university": university,
      "CardImage": fileImage,
    });

    return response.fold((l) => l, (r) => r);
  }
}
