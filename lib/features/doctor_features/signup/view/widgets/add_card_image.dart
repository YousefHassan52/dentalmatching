import 'package:dentalmatching/features/doctor_features/signup/controller/signup_doctor_controller_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AddCardImage extends StatelessWidget {
  const AddCardImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignupDoctorControllerImpl controller =
        Get.put(SignupDoctorControllerImpl());
    final screenWidth = MediaQuery.of(context).size.width;

    return MaterialButton(
      onPressed: () {
        controller.pickImage();
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        alignment: Alignment.center,
        width: screenWidth * 0.35, // Adjust this value as needed
        height: screenWidth * 0.2, // Adjust this value as needed
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "ID Photo",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.04, // Adjust this value as needed
                  ),
                ),
              ),
              SvgPicture.asset(
                "assets/svg/Boldd_Camera.svg",
                height: screenWidth * 0.08, // Adjust this value as needed
                width: screenWidth * 0.08, // Adjust this value as needed
              ),
            ],
          ),
        ),
      ),
    );
  }
}
