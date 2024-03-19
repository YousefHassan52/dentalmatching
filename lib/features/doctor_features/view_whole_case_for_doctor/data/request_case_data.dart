import 'package:dentalmatching/core/class/crud.dart';
import 'package:dentalmatching/core/constants/api_links.dart';

class RequestCaseData {
  final CRUD crud;

  RequestCaseData(this.crud);
  requestCase({
    required String caseId,
    required String token,
  }) async {
    var response =
        await crud.get(url: "${ApiLinks.requestCase}$caseId", token: token);

    return response.fold((l) => l, (r) => r);
  }

  cancelCase({
    required String caseId,
    required String token,
  }) async {
    var response = await crud.postWithToken(
        url: "${ApiLinks.cancelCase}$caseId", token: token, data: {});

    return response.fold((l) => l, (r) => r);
  }
}
