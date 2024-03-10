import 'package:dentalmatching/core/class/crud.dart';
import 'package:dentalmatching/core/constants/api_links.dart';

class DeleteAccountData {
  final CRUD crud;

  DeleteAccountData(this.crud);
  deleteAccount({
    required String token,
  }) async {
    var response = await crud.get(url: ApiLinks.deleteAccount, token: token);

    return response.fold((l) => l, (r) => r);
  }
}
