import 'package:dentalmatching/core/class/crud.dart';
import 'package:dentalmatching/core/constants/api_links.dart';

class ViewWholeCaseForAdminData {
  final CRUD crud;

  ViewWholeCaseForAdminData(this.crud);
  classify(
      {required String token,
      required String caseId,
      required List<String> dentalClassifications}) async {
    var response = await crud.post(
        url: ApiLinks.classifyCase,
        token: token,
        data: {"caseId": caseId, "dentalDiseases": dentalClassifications});

    return response.fold((l) => l, (r) => r);
  }
}
