// handling data view according to status request
// 34an mtktb4 if conditions kteeer fe el view
import 'package:dentalmatching/core/class/request_status.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  const HandlingDataView(
      {Key? key, required this.requestStatus, required this.successWidget})
      : super(key: key);
  final RequestStatus requestStatus;
  final Widget successWidget;
  @override
  Widget build(BuildContext context) {
    if (requestStatus == RequestStatus.OFFLINE_FAILURE) {
      return const Center(
        child: Text("Offline failure"),
      );
    } else if (requestStatus == RequestStatus.LOADING) {
      return const Center(
        child: Text("Loading"),
      );
    } else if (requestStatus == RequestStatus.SERVER_FAILURE) {
      return Center(
        child: Lottie.asset("assets/lottie/404.json", width: double.infinity),
      );
    } else if (requestStatus == RequestStatus.FAILURE) {
      return const Center(
        child: Text(
          "failure",
          style: TextStyle(color: Colors.black),
        ),
      );
    } else if (requestStatus == RequestStatus.UNKOWN_FAILURE) {
      return const Center(
        child: Text("Unkown failure"),
      );
    } else {
      return successWidget;
    }
  }
}
