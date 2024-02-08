import 'dart:io';

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
          print(response.data);
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

  Future<Either<RequestStatus, Map<String, dynamic>>> postWithImage({
    required String url,
    required Map<String, dynamic> data,
    File? image, // Add File? parameter for the image
  }) async {
    try {
      if (await CheckInternet.fun()) {
        Dio dio = Dio();

        // Create FormData object to handle form data including the image
        FormData formData = FormData.fromMap({
          ...data,
          if (image != null)
            'CardImage': await MultipartFile.fromFile(image.path),
        });

        // Disable Dio's default validateStatus behavior
        dio.options.validateStatus = (status) => true;

        Response response = await dio.post(url, data: formData);

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map<String, dynamic> json = response.data;
          return right(json);
        } else if (response.statusCode == 400) {
          print(response.data);
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
