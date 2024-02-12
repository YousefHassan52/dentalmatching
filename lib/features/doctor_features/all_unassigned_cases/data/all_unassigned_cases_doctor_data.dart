import 'package:dentalmatching/core/class/crud.dart';
import 'package:dentalmatching/core/constants/api_links.dart';

class UnassignedCasesDoctorData {
  final CRUD crud;

  UnassignedCasesDoctorData(this.crud);
  getCases({
    required String token,
  }) async {
    var response =
        await crud.get(url: ApiLinks.getUnassignedCasesDoctor, token: token);

    return response.fold((l) => l, (r) => r);
  }
}
