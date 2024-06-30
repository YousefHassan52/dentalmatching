import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/functions/check_internet.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class CRUD {
  final int _maxRetries = 3;
  final Duration _retryDelay = const Duration(seconds: 2);

  Future<Either<RequestStatus, Map<String, dynamic>>> _retryRequest(
    Future<Response> Function() request,
  ) async {
    int retryCount = 0;
    while (retryCount < _maxRetries) {
      try {
        Response response = await request();
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map<String, dynamic> json = response.data;
          return right(json);
        } else if (response.statusCode == 400) {
          print(response);

          return left(RequestStatus.UNAUTHORIZED_FAILURE);
        } else if (response.statusCode == 500) {
          print(response);

          return left(RequestStatus.INTERNAL_SERVER_ERROR);
        } else if (response.statusCode == 403) {
          print(response);

          return left(RequestStatus.BLOCKED_USER);
        } else {
          print(response);
          return left(RequestStatus.SERVER_FAILURE);
        }
      } on SocketException catch (e) {
        if (kDebugMode) {
          print('SocketException: $e');
        }
        retryCount++;
        if (retryCount < _maxRetries) {
          await Future.delayed(_retryDelay);
        }
      } on DioException catch (e) {
        if (kDebugMode) {
          print('DioException: $e');
        }
        return left(RequestStatus.UNKOWN_FAILURE);
      }
    }
    return left(RequestStatus.UNKOWN_FAILURE);
  }

  Future<Either<RequestStatus, Map<String, dynamic>>> post({
    required String url,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    if (await CheckInternet.fun()) {
      return _retryRequest(() async {
        Dio dio = Dio();
        Options options = Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $token',
          },
        );
        dio.options.validateStatus = (status) => true;
        return dio.post(url, data: data, options: options);
      });
    } else {
      return left(RequestStatus.OFFLINE_FAILURE);
    }
  }

  Future<Either<RequestStatus, Map<String, dynamic>>> postWithImage({
    required String url,
    required Map<String, dynamic> data,
    File? image,
  }) async {
    if (await CheckInternet.fun()) {
      return _retryRequest(() async {
        Dio dio = Dio();
        FormData formData = FormData.fromMap({
          ...data,
          if (image != null)
            'CardImage': await MultipartFile.fromFile(image.path),
        });
        dio.options.validateStatus = (status) => true;
        return dio.post(url, data: formData);
      });
    } else {
      return left(RequestStatus.OFFLINE_FAILURE);
    }
  }

  // hanst3mlha lel profile image
  Future<Either<RequestStatus, Map<String, dynamic>>> postWithToken({
    required String url,
    required Map<String, dynamic> data,
    File? image,
    String? imageName,
    String? token,
  }) async {
    if (await CheckInternet.fun()) {
      return _retryRequest(() async {
        Dio dio = Dio();
        FormData formData = FormData.fromMap({
          ...data,
          if (image != null && imageName != null)
            imageName: await MultipartFile.fromFile(image.path),
        });
        Options options = Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $token',
          },
        );
        dio.options.validateStatus = (status) => true;

        return dio.post(url, data: formData, options: options);
      });
    } else {
      return left(RequestStatus.OFFLINE_FAILURE);
    }
  }

  Future<Either<RequestStatus, Map<String, dynamic>>> postCase({
    required String url,
    required Map<String, dynamic> data,
    List<File>? xrayImages,
    List<File>? mouthImages,
    List<File>? prescriptionImages,
    String? token,
  }) async {
    if (await CheckInternet.fun()) {
      return _retryRequest(() async {
        Dio dio = Dio();
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
        Options options = Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $token',
          },
        );
        dio.options.validateStatus = (status) => true;
        return dio.post(url, data: formData, options: options);
      });
    } else {
      return left(RequestStatus.OFFLINE_FAILURE);
    }
  }

  Future<Either<RequestStatus, Map<String, dynamic>>> get({
    required String url,
    String? token,
  }) async {
    if (await CheckInternet.fun()) {
      return _retryRequest(() async {
        Dio dio = Dio();
        Options options = Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $token',
          },
        );
        dio.options.validateStatus = (status) => true;
        return dio.get(url, options: options);
      });
    } else {
      return left(RequestStatus.OFFLINE_FAILURE);
    }
  }
}
