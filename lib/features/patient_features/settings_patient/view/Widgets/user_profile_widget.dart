// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'CircleAvatarWidget.dart';

// class UserProfileWidget extends StatelessWidget {
//   final String title;
//   final String name;

//   const UserProfileWidget({super.key, required this.title, required this.name});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Padding(
//           padding: EdgeInsets.symmetric(
//               vertical: Get.width * 0.05, horizontal: Get.width * 0.02),
//           child: const CircleAvatarWidget(
//             imagePath: 'assets/svg/pp.svg',
//           ),
//         ),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Container(
//               width: 250,
//               alignment: Alignment.centerLeft,
//               child: FittedBox(
//                 fit: BoxFit.scaleDown,
//                 child: RichText(
//                   text: TextSpan(
//                     text: title,
//                     style: const TextStyle(
//                       fontSize:25 ,
//                       fontWeight: FontWeight.w300,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 5,),
//             Container(
//               width: 250,
//               alignment: Alignment.centerLeft,
//               child: FittedBox(
//                 fit: BoxFit.scaleDown,
//                 child: RichText(
//                   text: TextSpan(
//                     text: name,
//                     style: const TextStyle(
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         // IconButton(
//         //   onPressed: () {},
//         //   icon: SvgPicture.asset("assets/svg/editButton.svg"),
//         // )
//         //  IconButton(onPressed:() {
//         //       Get.to(DrProfile());
//         //     },
//         //      icon: Icon(Icons.gamepad_outlined))
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'circle_avatar_widget.dart';

class UserProfileWidget extends StatelessWidget {
  final String title;
  final String name;

  const UserProfileWidget({Key? key, required this.title, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double paddingVertical = Get.width * 0.05;
    double paddingHorizontal = Get.width * 0.02;

    return Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: paddingVertical,
            horizontal: paddingHorizontal,
          ),
          child: const CircleAvatarWidget(
            imagePath: 'assets/svg/pp.svg',
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: Get.width * 0.5,
              alignment: Alignment.centerLeft,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: RichText(
                  text: TextSpan(
                    text: title,
                    style: const TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              width: Get.width * 0.5,
              alignment: Alignment.centerLeft,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: RichText(
                  text: TextSpan(
                    text: name,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        // Add responsive IconButton or other widgets here
      ],
    );
  }
}

