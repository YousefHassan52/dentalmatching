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

  addProgress(
      {required String progressMessage,
      required String caseId,
      required String token,
      }) async {
    var response = await crud.postWithToken(
        url:
            "${ApiLinks.addProgress}CaseId=$caseId&ProgressMessage=$progressMessage",
        token: token,
        data: {});
    return response.fold((l) => l, (r) => r);
  }

  getProgress({required String token, required String caseId}) async {
    var response = await crud.get(
        url:
            "https://dentamatchbackend.smartwaveeg.com/DentalCase/getprogress?caseId=$caseId",
        token: token);

    return response.fold((l) => l, (r) => r);
  }

  appointmentTime({
    required String date,
    required List<String> times,
    required String token,
  }) async {
    var response = await crud.post(
        url: ApiLinks.appointmentTime,
        token: token,
        data: {"Date": date, "Times": times});
    print(response);

    return response.fold((l) => l, (r) => r);
  }

  editProgress(
      {required String progressMessage,
      required String caseId,
      required String progressId,
      required String token}) async {
    var response = await crud.post(
        url:
            "${ApiLinks.editProgress}CaseId=$caseId&ProgressMessage=$progressMessage&ProgressId=$progressId",
        token: token,
        data: {});
    print(response);

    return response.fold((l) => l, (r) => r);
  }
}
