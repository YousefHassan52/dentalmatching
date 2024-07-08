// ignore_for_file: file_names

import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/features/patient_features/patient_data_viewer/pateint_data_controller.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/view/Widgets/bar_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpperWidget extends StatelessWidget {
  const UpperWidget(
      {super.key,
      this.needBackButton = false,
      this.welcome = true,
      this.text = ''});
  final bool needBackButton;
  final bool welcome;
  final String text;

  @override
  Widget build(BuildContext context) {
    Get.put(PatientDataController());

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
          padding: const EdgeInsets.all(0),
          //  height: upperPartHeight + 100,
          child: Center(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (welcome == true) const BarProfileWidget(),
                if (welcome == false)
                  if (needBackButton == true)
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 35, left: 5, bottom: 10),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                          if (welcome == false)
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  text,
                                  style: const TextStyle(
                                    fontSize: 18,
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
      ),
    );
  }
}
