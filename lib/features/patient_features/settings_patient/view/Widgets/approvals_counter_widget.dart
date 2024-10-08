import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApprovalsCounterWidget extends GetView<MyServices> {
  final String approvalsCounter;
  final String status;
  const ApprovalsCounterWidget({
    super.key,
    required this.approvalsCounter,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Get.to(CasesScreen());
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            approvalsCounter,
            style: Styles.mediumTitle,
          ),
          // ),
          Text(
            status,
            style: Styles.textStyleGrey,
          ),
        ],
      ),
    );
  }
}
