import 'package:dentalmatching/core/class/request_status.dart';

class HandlingResponseType {
  static fun(response) {
    if (response is RequestStatus) {
      // error
      return response;
    } else {
      // map<String,dynamic>
      return RequestStatus.SUCCESS;
    }
  }
}
