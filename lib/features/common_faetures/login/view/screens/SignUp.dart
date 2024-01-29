import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'PreSignup.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
        IconButton(
          icon: const Icon(
            Icons.keyboard_double_arrow_right_outlined,
            color: Color(0xFF1E496B),
            size: 50,
          ),
          onPressed: () {
            Get.off(const PreSignup());
          },
        ),
      ]),
    );
  }
}