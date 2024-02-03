import 'package:dentalmatching/core/class/crud.dart';
import 'package:dentalmatching/core/constants/api_links.dart';

class SignupPatientData {
  final CRUD crud;

  SignupPatientData(this.crud);
  postData({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required int age,
    required bool gender,
    required String government,
    required String phoneNumber,
    required String role,
    required String chronicDiseases,
  }) async {
    var response = await crud.post(url: ApiLinks.signupPatient, data: {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password,
      "age": age,
      "gender": gender,
      "government": government,
      "phoneNumber": phoneNumber,
      "role": role,
      "chronicDiseases": chronicDiseases,
    });

    return response.fold((l) => l, (r) => r);
  }
}
