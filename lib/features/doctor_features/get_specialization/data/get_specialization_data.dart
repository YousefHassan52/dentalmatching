import 'package:dentalmatching/core/class/crud.dart';
import 'package:dentalmatching/core/constants/api_links.dart';

class GetSpecializationData {
  final CRUD crud;

  GetSpecializationData(this.crud);
  getData({
    required String token,
  }) async {
    var response =
        await crud.get(token: token, url: ApiLinks.getSpecialization);

    return response.fold((l) => l, (r) => r);
  }
}
