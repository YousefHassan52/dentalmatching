import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/features/doctor_features/DoctorProfile/View/Widget/DrProfileWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AppUpperWidget extends StatelessWidget {
  const AppUpperWidget({super.key});

  @override
  Widget build(BuildContext context) {
     double upperPartHeight = Get.height * 0.2;
    return Container(
        height: upperPartHeight,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const DrProfileWidget(title: 'Welcome',name: 'Hajar Abdelhamed'),
              SizedBox(
                height: upperPartHeight * 0.03,
              ),
            ],
          ),
        ),
      );
  }
}