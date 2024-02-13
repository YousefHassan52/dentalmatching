import 'package:dentalmatching/core/class/crud.dart';
import 'package:dentalmatching/core/constants/api_links.dart';

class GetDoctorCasesData {
  final CRUD crud;

  GetDoctorCasesData(this.crud);
  getCases({
    required String token,
  }) async {
    var response = await crud.get(url: ApiLinks.getDoctorCases, token: token);

    return response.fold((l) => l, (r) => r);
  }
}
