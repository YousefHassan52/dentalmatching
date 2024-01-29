
import 'package:dentalmatching/core/constants/routes_names.dart';
import 'package:dentalmatching/features/common_faetures/login/view/screens/PreSignup.dart';
import 'package:dentalmatching/features/common_faetures/login/view/widgets/CentImg.dart';
import 'package:dentalmatching/features/common_faetures/login/view/widgets/Heading.dart';
import 'package:dentalmatching/features/common_faetures/login/view/widgets/TextForm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/CustomButton.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Heading(text: 'Welcome Back'),
              //const CentImg(Centeredimg: 'log.svg'),
              const TextForm(
                hint: "Phone Number",
                icon: Icons.phone_outlined,
                type: TextInputType.phone,
                password: false,
                
              ),
              
              const TextForm(
                hint: "Password",
                icon: Icons.lock_open_outlined,
                password: true,
                // icon2: Icons.remove_red_eye_outlined,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10, right: 20),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'ForgetPaassword?',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: Color(0xFF1E496B),
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      decoration: TextDecoration.underline,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const CustomButton(
                text: 'Log in',
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: Get.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(color: Color.fromARGB(255, 118, 119, 120),fontSize: 10),
                    ),
                    TextButton(
                      onPressed: (){
                        Get.off(const PreSignup());  
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Color(0xFF1E496B),
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          fontSize: 10,
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
