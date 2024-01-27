import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/functions/check_internet.dart';

import 'package:http/http.dart' as http;

class CRUD {
  Future<Either<RequestStatus, Map<String, dynamic>>> post(
      {required String url, required Map<String, dynamic> data}) async {
    try {
      if (await CheckInternet.fun()) {
        var response = await http.post(Uri.parse(url), body: data);
        if (response.statusCode == 200 ||
            response.statusCode == 201 ||
            response.statusCode == 401) {
          Map<String, dynamic> json = jsonDecode(response.body);
          print("response code ya joooe ${response.statusCode}");
          return right(json);
        } else {
          return left(RequestStatus.SERVER_FAILURE);
        }
      } else {
        return left(RequestStatus.OFFLINE_FAILURE);
      }
    } catch (error) {
      print(error.toString());
      return left(RequestStatus.UNKOWN_FAILURE);
    }
  }
}
