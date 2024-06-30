import 'dart:io';

import 'package:dentalmatching/core/class/crud.dart';
import 'package:dentalmatching/core/constants/api_links.dart';

class EditSpecializationData {
  final CRUD crud;

  EditSpecializationData(this.crud);
  postData({
    required String specialization,
    required String token,
    required File requiredFile,
  }) async {
    var response = await crud.postWithToken(
        token: token,
        image: requiredFile,
        imageName: "RequiredFile",
        url: ApiLinks.editSpecialization,
        data: {
          "specialization": specialization,
        });

    return response.fold((l) => l, (r) => r);
  }
}
