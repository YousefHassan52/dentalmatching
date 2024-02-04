import 'package:dentalmatching/core/class/crud.dart';
import 'package:dentalmatching/core/constants/api_links.dart';

class CheckEmailForgetPasswordData {
  final CRUD crud;

  CheckEmailForgetPasswordData(this.crud);
  postData({
    required String email,
  }) async {
    var response = await crud.post(url: ApiLinks.checkEmail, data: {
      "Email": email,
    });

    return response.fold((l) => l, (r) => r);
  }
}
