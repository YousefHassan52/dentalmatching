// ignore_for_file: file_names

import 'package:dentalmatching/core/class/crud.dart';
import 'package:dentalmatching/core/constants/api_links.dart';

class HomeDoctorData {
  final CRUD crud;

  HomeDoctorData(this.crud);
  getCases({
    required String token,
  }) async {
    var response = await crud.get(url: ApiLinks.getThreeCases, token: token);

    return response.fold((l) => l, (r) => r);
  }
}
