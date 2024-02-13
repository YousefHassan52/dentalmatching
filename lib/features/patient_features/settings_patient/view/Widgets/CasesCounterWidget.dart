import 'package:dentalmatching/core/constants/styles.dart';
import 'package:flutter/material.dart';

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
        // Get.to(CasesScreen());
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
