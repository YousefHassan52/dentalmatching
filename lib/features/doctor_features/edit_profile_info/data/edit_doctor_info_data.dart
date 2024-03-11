import 'package:dentalmatching/core/class/crud.dart';
import 'package:dentalmatching/core/constants/api_links.dart';

class EditDoctorInfoData {
  final CRUD crud;

  EditDoctorInfoData(this.crud);
  postData({
    required String fullname,
    required String email,
    required int age,
    required bool gender,
    required String government,
    required String phoneNumber,
    required String userName,
    required String university,
    required String token,
  }) async {
    var response =
        await crud.post(token: token, url: ApiLinks.updateDoctor, data: {
      "fullName": fullname,
      "email": email,
      "age": age,
      "gender": gender,
      "city": government,
      "phoneNumber": phoneNumber,
      "userName": userName,
      "university": university
    });

    return response.fold((l) => l, (r) => r);
  }
}
