import 'package:dentalmatching/core/class/crud.dart';
import 'package:dentalmatching/core/constants/api_links.dart';

class SignupPatientData {
  final CRUD crud;

  SignupPatientData(this.crud);
  postData({
    required String fullname,
    required String email,
    required String password,
    required int age,
    required bool gender,
    required String government,
    required String phoneNumber,
    required String role,
    required String address,
  }) async {
    var response = await crud.post(url: ApiLinks.signupPatient, data: {
      "fullName": fullname,
      "email": email,
      "password": password,
      "age": age,
      "gender": gender,
      "city": government,
      "phoneNumber": phoneNumber,
      "role": role,
      "Address": address,
    });

    return response.fold((l) => l, (r) => r);
  }
}
