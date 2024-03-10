import 'package:dentalmatching/core/class/crud.dart';
import 'package:dentalmatching/core/constants/api_links.dart';

class ViewFullCasePatientData {
  final CRUD crud;

  ViewFullCasePatientData(this.crud);
  deleteCase({
    required String token,
    required String caseId,
  }) async {
    var response = await crud.postWithToken(
        url: "${ApiLinks.deleteCase}$caseId", token: token, data: {});

    return response.fold((l) => l, (r) => r);
  }
}
