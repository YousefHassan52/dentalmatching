
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../widgets/PreSignWidget.dart';
import 'Log_In.dart';



class PreSignup extends StatelessWidget {
  const PreSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          icon: const Icon(
            Icons.keyboard_double_arrow_right_outlined,
            color: Color(0xFF1E496B),
            size: 50,
          ),
          onPressed: () {
            Get.off(const Login());
          },
        ),
      ]),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
             PreSignUpWidget(image: 'doctors.svg', userType: 'Doctor',),
             PreSignUpWidget(image: 'doctors.svg', userType: 'Patient',),
            ],
          ),
          
        ),
      ),
    );
  }
}
