import 'package:dentalmatching/core/class/crud.dart';
import 'package:dentalmatching/core/constants/api_links.dart';

class LoginData {
  final CRUD crud;

  LoginData(this.crud);
  postData({
    required String phoneNumber,
    required String password,
  }) async {
    var response = await crud.post(url: ApiLinks.login, data: {
      "Phone": phoneNumber,
      "Password": password,
    });

    return response.fold((l) => l, (r) => r);
  }
}
