import 'package:dentalmatching/core/class/crud.dart';
import 'package:dentalmatching/core/constants/api_links.dart';

class ReportCaseData {
  final CRUD crud;

  ReportCaseData(this.crud);
  reportCase({
    required String caseId,
    required String token,
  }) async {
    var response =
        await crud.get(url: "${ApiLinks.reportCase}$caseId", token: token);

    return response.fold((l) => l, (r) => r);
  }
}
