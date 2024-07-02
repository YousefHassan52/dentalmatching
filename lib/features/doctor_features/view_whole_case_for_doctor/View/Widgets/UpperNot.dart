// import 'package:dentalmatching/core/constants/colors.dart';
// import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/View/Widget/DrProfileWidget.dart';
// import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/controller/unassigned_cases_doctor_controller_impl.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class UpperFullCaseWidget extends StatelessWidget {
//   const UpperFullCaseWidget({super.key});

// ignore_for_file: non_constant_identifier_names

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
import 'package:dentalmatching/features/doctor_features/doctor_data_viewer/doctor_data_controller.dart';
import 'package:dentalmatching/features/doctor_features/view_whole_case_for_doctor/View/widgets/bio_bar_widget.dart';
import 'package:dentalmatching/features/doctor_features/view_whole_case_for_doctor/controller/view_whole_case_doctor_controller_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpperFullCaseWidget extends StatelessWidget {
  const UpperFullCaseWidget(
      {super.key,
      this.needBackButton = false,
      this.CaseDesc = false,
      required this.text});
  final bool needBackButton;
  final bool CaseDesc;
  final String text;

  @override
  Widget build(BuildContext context) {
    Get.put(DoctorDataController());
    // Register the controller if not registered yet
    if (!Get.isRegistered<ViewWholeCaseDoctorControllerImpl>()) {
      Get.put(ViewWholeCaseDoctorControllerImpl());
    }

    final controller = Get.find<
        ViewWholeCaseDoctorControllerImpl>(); // momkn 2a7ot controller 8ero
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
          color: AppColors.mainColor.withOpacity(0.85),
        ),
        child: Container(
          padding: const EdgeInsets.all(0),
          //  height: upperPartHeight + 100,
          child: Center(
            child: Column(
              children: [
                if (needBackButton == true)
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 35, left: 5, bottom: 10),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              text,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                if (CaseDesc == true) BioBarWidget(controller: controller),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
