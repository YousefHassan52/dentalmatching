import 'package:dentalmatching/core/class/crud.dart';
import 'package:dentalmatching/core/constants/api_links.dart';

class ResetPasswordData {
  final CRUD crud;

  ResetPasswordData(this.crud);
  postData({required String email, required String password}) async {
    var response = await crud.post(url: ApiLinks.restPassword, data: {
      "email": email,
      "password": password,
    });

    return response.fold((l) => l, (r) => r);
  }
}
