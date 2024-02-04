import 'package:dentalmatching/core/class/crud.dart';
import 'package:dentalmatching/core/constants/api_links.dart';

class VerifyEmailForgetPasswordData {
  final CRUD crud;

  VerifyEmailForgetPasswordData(this.crud);
  postData({
    required String email,
    required String verifyCode,
  }) async {
    var response =
        await crud.post(url: ApiLinks.verifyEmailForgetPassword, data: {
      "email": email,
      "verificationCode": verifyCode,
    });

    return response.fold((l) => l, (r) => r);
  }
}
