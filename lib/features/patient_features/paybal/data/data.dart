import 'package:dentalmatching/core/class/crud.dart';
import 'package:dentalmatching/core/constants/api_links.dart';

class PaypalData {
  final CRUD crud;

  PaypalData(this.crud);
  payment() async {
    var response =
        await crud.post(url: ApiLinks.paypal, data: {"intent": "capture"});

    return response.fold((l) => l, (r) => r);
  }
}
