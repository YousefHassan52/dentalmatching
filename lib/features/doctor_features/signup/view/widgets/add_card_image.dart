import 'package:dentalmatching/features/doctor_features/signup/controller/signup_doctor_controller_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AddCardImage extends StatelessWidget {
  const AddCardImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SignupDoctorControllerImpl controller =
        Get.put(SignupDoctorControllerImpl());
    return MaterialButton(
      onPressed: () {
        controller.pickImage();
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        alignment: Alignment.center,
        width: Get.width * 0.5,
        height: Get.width * 0.3 - 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF4A6BAD),
                Color.fromRGBO(86, 128, 212, 0.475),
              ]),
          boxShadow: const [
            BoxShadow(
              color: Color(0xffC3C3C3),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                "ID Photo",
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              Spacer(),
              SvgPicture.asset(height: 30, "assets/svg/Boldd_Camera.svg")
            ],
          ),
        ),
      ),
    );
  }
}
