import 'package:dentalmatching/core/class/crud.dart';
import 'package:dentalmatching/core/constants/api_links.dart';

class EditPatientInfoData {
  final CRUD crud;

  EditPatientInfoData(this.crud);
  postData({
    required String fullname,
    required String email,
    required int age,
    required bool gender,
    required String government,
    required String phoneNumber,
    required String address,
    required String userName,
    required String token,
  }) async {
    var response = await crud
        .postWithToken(token: token, url: ApiLinks.updatePatient, data: {
      "fullName": fullname,
      "email": email,
      "age": age,
      "gender": gender,
      "city": government,
      "phoneNumber": phoneNumber,
      "address": address,
      "userName": userName,
    });

    return response.fold((l) => l, (r) => r);
  }
}
