import 'package:dentalmatching/core/class/crud.dart';
import 'package:dentalmatching/core/constants/api_links.dart';

class NotificationData {
  final CRUD crud;

  NotificationData(this.crud);
  postData({
    required String token,
    required String notificationToken,
    required String userName,
  }) async {
    var response =
        await crud.post(url: ApiLinks.notificationToken, token: token, data: {
      "userToken": notificationToken,
      "userName": userName,
    });

    return response.fold((l) => l, (r) => r);
  }
}
