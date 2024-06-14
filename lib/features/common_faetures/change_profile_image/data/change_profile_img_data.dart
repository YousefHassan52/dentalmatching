import 'dart:io';

import 'package:dentalmatching/core/class/crud.dart';
import 'package:dentalmatching/core/constants/api_links.dart';

class ChangeProfileImgData {
  final CRUD crud;

  ChangeProfileImgData(this.crud);
  postData({
    required String token,
    required File fileImage,
  }) async {
    var response = await crud.postWithToken(
        token: token,
        url: ApiLinks.changeProfileImg,
        image: fileImage,
        imageName: "ProfileImage",
        data: {});

    return response.fold((l) => l, (r) => r);
  }
}
