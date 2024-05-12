import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportButton extends StatelessWidget {
  const ReportButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: SizedBox(
        height: 50,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color.fromARGB(255, 209, 88, 7),
                    const Color.fromRGBO(228, 99, 40, 0.475),
                  ]),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: MaterialButton(
              onPressed: () {
                // Add your onPressed logic here
              },
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                "Report".tr,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
