import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'Views/Widget/PreSignUpWidget.dart';

class PreSignup extends StatelessWidget {
  const PreSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        //   actions: [
        //   IconButton(
        //     icon: const Icon(
        //       Icons.keyboard_double_arrow_right_outlined,
        //       color: AppColors.blueTextColor,
        //       size: 50,
        //     ),
        //     onPressed: () {
        //      Get.offNamed(AppRoutes.login);
        //     },
        //   ),
        // ]
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_double_arrow_left_outlined,
            color: AppColors.blueTextColor,
            size: 50,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: PreSignUpWidget(
                role: "D O C T O R  ",
                image: "assets/svg/doctors.svg",
                onTap: () {},
              ),
            ),
            Expanded(
                child: PreSignUpWidget(
              role: "P A T I E N T",
              image: "assets/svg/Patient.svg",
              onTap: () {},
            )),
          ],
        ),
        // child: Center(
        //   child: Column(
        //     children: [
        //       PreSignUpWidget(
        //         image: 'assets/svg/doctors.svg',
        //         userType: 'Doctor',
        //         onTap: () {
        //           Get.toNamed(AppRoutes.signupDoctor);
        //         },
        //       ),
        //       PreSignUpWidget(
        //         image: 'assets/svg/Patient.svg',
        //         userType: 'Patient',
        //         onTap: () {
        //           Get.toNamed(AppRoutes.signupPatinet);
        //         },
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
