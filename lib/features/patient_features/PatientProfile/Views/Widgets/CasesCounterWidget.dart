import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/features/patient_features/Cases/Views/Cases.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CasesCounterWidget extends GetView<MyServices> {
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
        Get.to(CasesScreen());
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [ 
          GetX<MyServices>(builder: (controller) => Text(
              '${controller.casesCounter}',
              style: Styles.mediumTitle,
            ),),
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
