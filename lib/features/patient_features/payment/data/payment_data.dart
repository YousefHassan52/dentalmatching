import 'package:dentalmatching/core/class/crud.dart';
import 'package:dentalmatching/core/constants/api_links.dart';

class PaymentData {
  final CRUD crud;

  PaymentData(this.crud);
  payment({
    required String fullName,
    required String userName,
    required String email,
    required String phone,
    required int price,
  }) async {
    var response = await crud.post(url: ApiLinks.payment, data: {
      "totalPrice": price,
      "firstName": fullName,
      "lastName": userName,
      "email": email,
      "phone_number": phone
    });

    return response.fold((l) => l, (r) => r);
  }
}
