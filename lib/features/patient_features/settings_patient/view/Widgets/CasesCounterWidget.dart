import 'package:dentalmatching/core/constants/api_links.dart';
import 'package:dentalmatching/core/constants/routes_names.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CasesCounterWidget extends StatelessWidget {
  final String counter;
  final String status;
  const CasesCounterWidget({
    super.key,
    required this.counter,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
       // Get.toNamed(AppRoutes.myCasesPatient);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            counter,
            style: Styles.mediumTitle,
          ),
          Text(
            status,
            style: Styles.textStyleGrey,
            //  const TextStyle(color: Color.fromARGB(255, 93, 92, 92)),
          ),
        ],
      ),
    );
  }
}
