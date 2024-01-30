
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/routes_names.dart';
import 'package:dentalmatching/features/common_faetures/loginn/view/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'Views/Widget/PreSignUpWidget.dart';


class PreSignup extends StatelessWidget {
  const PreSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
        IconButton(
          icon: const Icon(
            Icons.keyboard_double_arrow_right_outlined,
            color: AppColors.blueTextColor,
            size: 50,
          ),
          onPressed: () {
           Get.offNamed(AppRoutes.login);
          },
        ),
      ]),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
             PreSignUpWidget(image: 'assets/svg/doctors.svg', userType: 'Doctor',),
             PreSignUpWidget(image: 'assets/svg/Patient.svg', userType: 'Patient',),
            ],
          ),
          
        ),
      ),
    );
  }
}
