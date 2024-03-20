import 'package:dentalmatching/core/class/crud.dart';
import 'package:dentalmatching/core/constants/api_links.dart';

class SearchCasesData {
  final CRUD crud;

  SearchCasesData(this.crud);
  getCases({
    required String token,
    required String query,
  }) async {
    var response = await crud.get(
        url: "${ApiLinks.getCasesByDescription}$query", token: token);

    return response.fold((l) => l, (r) => r);
  }
}
