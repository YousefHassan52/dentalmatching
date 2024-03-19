import 'package:dentalmatching/core/class/crud.dart';
import 'package:dentalmatching/core/constants/api_links.dart';

class CategoryCasesData {
  final CRUD crud;

  CategoryCasesData(this.crud);
  getCases({
    required String token,
    required String category,
  }) async {
    var response =
        await crud.get(url: "${ApiLinks.categoryCases}$category", token: token);

    return response.fold((l) => l, (r) => r);
  }
}
