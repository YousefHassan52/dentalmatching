// import 'package:dentalmatching/core/constants/colors.dart';
// import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/View/Widget/DrProfileWidget.dart';
// import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/controller/unassigned_cases_doctor_controller_impl.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class AppUpperWidget extends StatelessWidget {
//   const AppUpperWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     UnassignedCasesDoctorControllerImpl controller = Get.put(
//         UnassignedCasesDoctorControllerImpl()); // momkn 2a7ot controller 8ero
//     double upperPartHeight = Get.height * 0.2;
//     return Container(
//       height: upperPartHeight,
//       decoration: const BoxDecoration(
//         borderRadius: BorderRadius.only(
//           bottomLeft: Radius.circular(20),
//           bottomRight: Radius.circular(20),
//         ),
//         image: DecorationImage(
//           fit: BoxFit.fill,
//           image: AssetImage("assets/images/signup.png"),
//         ),
//       ),
//       child: DecoratedBox(
//         decoration: BoxDecoration(
//           borderRadius: const BorderRadius.only(
//             bottomLeft: Radius.circular(20),
//             bottomRight: Radius.circular(20),
//           ),
//           color: AppColors.mainColor.withOpacity(0.8),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             DrProfileWidget(
//                 title: 'Welcome',
//                 name: 'Dr.${controller.doctorModel.fullName}'),
//             SizedBox(
//               height: upperPartHeight * 0.03,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// ignore: file_names
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/controller/unassigned_cases_doctor_controller_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppUpperWidget extends StatelessWidget {
  const AppUpperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    UnassignedCasesDoctorControllerImpl controller = Get.put(
         UnassignedCasesDoctorControllerImpl()); // momkn 2a7ot controller 8ero
   double upperPartHeight = Get.height * 0.2;
    return Container(
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
        child: Container(
          padding: const EdgeInsets.all(16),
          height: upperPartHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            // row take size of the parent container = upperPartHeight
            children: [
             
              Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: CircleAvatar(
                    radius: 37,
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: SizedBox.fromSize(
                          size: const Size.fromRadius(50),
                          child: Image.asset(
                            "assets/images/profilepicture.png",
                          )),
                    ),
                  ),
                  // child: CircleAvatar(
                  //   radius: 40,
                  //   backgroundImage: AssetImage(
                  //     "assets/images/profilepicture.png",
                  //   ),
                  // ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Flexible(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "WELCOME",
                          style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                         'Dr.${ controller.doctorModel.fullName.split(' ')[0]}',
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                
              ),
              // Spacer(),
              //  IconButton(
              //   onPressed: () {
              //     Get.back();
              //   },
              //   icon: Icon(
              //     Icons.keyboard_double_arrow_left_outlined,
              //     size: 30,
              //     color: Colors.white,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

