import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/features/patient_features/AddCase/Controller/FormController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'UserProfileWidget.dart';

class UpperWidget extends StatelessWidget {
  const UpperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AddCaseController controller =
        Get.put(AddCaseController()); // momken te7tag hena controller mo5tlef
    double upperPartHeight = Get.height * 0.2;
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/images/signup.png"),
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          color: AppColors.mainColor.withOpacity(0.8),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          height: upperPartHeight,
          child: Row(
            // row take size of the parent container = upperPartHeight
            children: [
              const Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                      "assets/images/profilepicture.png",
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Flexible(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "WELCOME",
                          style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          controller.userModel.fullName.split(' ')[0],
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
