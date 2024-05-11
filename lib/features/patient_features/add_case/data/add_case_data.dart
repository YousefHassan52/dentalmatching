import 'dart:io';

import 'package:dentalmatching/core/class/crud.dart';
import 'package:dentalmatching/core/constants/api_links.dart';

class AddCaseData {
  final CRUD crud;

  AddCaseData(this.crud);
  postData(
      {List<File>? xrayImages,
      List<File>? mouthImages,
      List<File>? prescriptionImages,
      required String token, // Add String? parameter for the token
      required Map<String, dynamic> data}) async {
    var response = await crud.postCase(
        url: ApiLinks.addCasePatient,
        data: data,
        mouthImages: mouthImages,
        xrayImages: xrayImages,
        prescriptionImages: prescriptionImages,
        token: token);

    return response.fold((l) => l, (r) => r);
  }
}
