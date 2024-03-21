import 'package:dentalmatching/core/class/crud.dart';
import 'package:dentalmatching/core/constants/api_links.dart';

class AdminDoctorHomeData {
  final CRUD crud;

  AdminDoctorHomeData(this.crud);
  getUnkownCases({
    required String token,
  }) async {
    var response = await crud.get(url: ApiLinks.getUnkownCases, token: token);

    return response.fold((l) => l, (r) => r);
  }
}
