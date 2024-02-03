import 'package:dartz/dartz.dart';
import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/functions/check_internet.dart';
import 'package:dio/dio.dart';

class CRUD {
  Future<Either<RequestStatus, Map<String, dynamic>>> post({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    try {
      if (await CheckInternet.fun()) {
        Dio dio = Dio();

        // Disable Dio's default validateStatus behavior
        dio.options.validateStatus = (status) => true;

        Response response = await dio.post(url, data: data);

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map<String, dynamic> json = response.data;
          return right(json);
        } else if (response.statusCode == 400) {
          // Handle status code 400 specific logic here
          return left(RequestStatus.UNAUTHORIZED_FAILURE);
        } else if (response.statusCode == 500) {
          return left(RequestStatus.INTERNAL_SERVER_ERROR);
        } else {
          return left(RequestStatus.SERVER_FAILURE);
        }
      } else {
        return left(RequestStatus.OFFLINE_FAILURE);
      }
    } on DioException catch (e) {
      // Handle other DioError cases or rethrow the exception
      print(e.toString());
      return left(RequestStatus.UNKOWN_FAILURE);
    }
  }
}
