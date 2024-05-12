import 'package:dentalmatching/core/class/crud.dart';
import 'package:dentalmatching/core/constants/api_links.dart';

class CommentsData {
  final CRUD crud;

  CommentsData(this.crud);
  getComments({required String token, required String caseId}) async {
    var response =
        await crud.get(url: "${ApiLinks.getCaseComments}$caseId", token: token);

    return response.fold((l) => l, (r) => r);
  }

  addComments(
      {required String token,
      required String caseId,
      required String comment}) async {
    var response = await crud.post(
        url: "${ApiLinks.addCaseComments}caseId=$caseId&comment=$comment",
        token: token,
        data: {});

    return response.fold((l) => l, (r) => r);
  }
}
