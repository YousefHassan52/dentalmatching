import 'package:dentalmatching/core/class/crud.dart';
import 'package:dentalmatching/core/constants/api_links.dart';

class ChangePasswordData {
  final CRUD crud;

  ChangePasswordData(this.crud);
  changePassword({
    required String token,
    required String currentPassword,
    required String newPassword,
  }) async {
    var response =
        await crud.post(token: token, url: ApiLinks.changePassword, data: {
      "currentPassword": currentPassword,
      "newPassword": newPassword,
    });

    return response.fold((l) => l, (r) => r);
  }
}
