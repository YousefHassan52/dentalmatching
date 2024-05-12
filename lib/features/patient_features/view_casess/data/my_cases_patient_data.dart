import 'package:dentalmatching/core/class/crud.dart';
import 'package:dentalmatching/core/constants/api_links.dart';

class MyCasesPatientData {
  final CRUD crud;

  MyCasesPatientData(this.crud);
  getMyCases({
    required String token,
  }) async {
    var response = await crud.get(url: ApiLinks.myCasesPatient, token: token);

    return response.fold((l) => l, (r) => r);
  }
}
