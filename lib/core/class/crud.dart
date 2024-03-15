import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/functions/check_internet.dart';
import 'package:dio/dio.dart';

class CRUD {
  Future<Either<RequestStatus, Map<String, dynamic>>> post({
    required String url,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    try {
      if (await CheckInternet.fun()) {
        Dio dio = Dio();
        Options options = Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $token',
          },
        );
        // Disable Dio's default validateStatus behavior
        dio.options.validateStatus = (status) => true;

        Response response = await dio.post(
          url,
          data: data,
          options: options,
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map<String, dynamic> json = response.data;
          return right(json);
        } else if (response.statusCode == 400) {
          print(response.data);
          return left(RequestStatus.UNAUTHORIZED_FAILURE);
        } else if (response.statusCode == 500) {
          return left(RequestStatus.INTERNAL_SERVER_ERROR);
        } else {
          print(response);
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

  Future<Either<RequestStatus, Map<String, dynamic>>> postWithToken({
    required String url,
    required Map<String, dynamic> data,
    File? image,
    String? token, // Add String? parameter for the token
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

        // Create headers with Authorization bearer token
        Options options = Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $token',
          },
        );

        // Disable Dio's default validateStatus behavior
        dio.options.validateStatus = (status) => true;

        // Make the POST request with the provided options
        Response response = await dio.post(
          url,
          data: formData,
          options: options,
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map<String, dynamic> json = response.data;
          return right(json);
        } else if (response.statusCode == 400) {
          print(response.data);
          return left(RequestStatus.UNAUTHORIZED_FAILURE);
        } else if (response.statusCode == 500) {
          return left(RequestStatus.INTERNAL_SERVER_ERROR);
        } else {
          print(response.data);
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

  Future<Either<RequestStatus, Map<String, dynamic>>> postCase({
    required String url,
    required Map<String, dynamic> data,
    List<File>? xrayImages,
    List<File>? mouthImages,
    List<File>? prescriptionImages,
    String? token, // Add String? parameter for the token
  }) async {
    try {
      if (await CheckInternet.fun()) {
        Dio dio = Dio();

        // Create FormData object to handle form data including the images
        FormData formData = FormData.fromMap({
          ...data,
          if (xrayImages != null)
            'XrayImages': xrayImages
                .map((file) => MultipartFile.fromFileSync(file.path))
                .toList(),
          if (mouthImages != null)
            'MouthImages': mouthImages
                .map((file) => MultipartFile.fromFileSync(file.path))
                .toList(),
          if (prescriptionImages != null)
            'PrescriptionImages': prescriptionImages
                .map((file) => MultipartFile.fromFileSync(file.path))
                .toList(),
        });

        // Create headers with Authorization bearer token
        Options options = Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $token',
          },
        );
        // Disable Dio's default validateStatus behavior
        dio.options.validateStatus = (status) => true;

        Response response = await dio.post(
          url,
          data: formData,
          options: options,
        );

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

  Future<Either<RequestStatus, Map<String, dynamic>>> get({
    required String url,
    String? token, // Add String? parameter for the token
  }) async {
    try {
      if (await CheckInternet.fun()) {
        Dio dio = Dio();

        // Create headers with Authorization bearer token
        Options options = Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $token',
          },
        );
        // Disable Dio's default validateStatus behavior
        dio.options.validateStatus = (status) => true;

        Response response = await dio.get(
          url,
          options: options,
        );

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
