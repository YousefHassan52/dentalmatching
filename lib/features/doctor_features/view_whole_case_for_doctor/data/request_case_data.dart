import 'package:dentalmatching/core/class/crud.dart';
import 'package:dentalmatching/core/constants/api_links.dart';

class RequestCaseData {
  final CRUD crud;

  RequestCaseData(this.crud);
  requestCase({
    required String caseId,
    required String googleMapLink,
    required String time,
    required String token,
  }) async {
//caseId=21b63c0f-3132-41dd-9a90-4dce3762a045&appointmentDateTime=2024-03-25T10:00&googleMapLink=https://g.co/kgs/g6XdzC3
    var response = await crud.get(
        url:
            "${ApiLinks.requestCase}caseId=$caseId&googleMapLink=$googleMapLink&appointmentDateTime=$time",
        token: token);

    return response.fold((l) => l, (r) => r);
  }

  cancelCase({
    required String caseId,
    required String token,
  }) async {
    var response = await crud.postWithToken(
        url: "${ApiLinks.cancelCase}$caseId", token: token, data: {});

    return response.fold((l) => l, (r) => r);
  }
}
