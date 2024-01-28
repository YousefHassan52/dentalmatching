import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PreSignUpWidget extends StatelessWidget {
  const PreSignUpWidget({super.key, required this.image, required this.userType});
 final String image;
 final String userType;
  @override
  Widget build(BuildContext context) {
    return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  //decoration: BoxDecoration(shape: BoxShape.circle,),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(20, 68, 100, 160),
                  ),
                  // height: 100,
                  // width: 250,
                  child: SvgPicture.asset(
                    image,
                    height: 200,
                  ),
                ),
              ),
               Text(
                userType,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E496B),
                ),
              )
            ],
          );
  }
}