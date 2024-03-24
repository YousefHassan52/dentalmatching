import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/constants/routes_names.dart';
import 'package:dentalmatching/core/constants/styles.dart';

import 'package:dentalmatching/core/shared/shimmer.dart';
import 'package:dentalmatching/features/doctor_features/HomaPageDr/View/Widgets/AppointmentFullScreen.dart';
import 'package:dentalmatching/features/doctor_features/HomaPageDr/View/Widgets/Categories.dart';
import 'package:dentalmatching/features/doctor_features/HomaPageDr/View/Widgets/FormView.dart';
import 'package:dentalmatching/features/doctor_features/HomaPageDr/View/Widgets/TextTitle.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/View/Widget/AppUpper.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/controller/unassigned_cases_doctor_controller_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomePageDr extends StatelessWidget {
  const HomePageDr({super.key});

  @override
  Widget build(BuildContext context) {
    UnassignedCasesDoctorControllerImpl externalController =
        Get.put(UnassignedCasesDoctorControllerImpl());
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(top: 0),
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                  const AppUpperWidget(),
          const SizedBox(
            height: 10,
          ),
          IconButton(
            onPressed: () {
              Get.toNamed(AppRoutes.searchCasesScreen);
            },
            icon: Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(94, 183, 181, 181)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      "Search".tr,
                      style: Styles.textStyle16.copyWith(
                          color: Colors.grey, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const Flexible(
                    child: Icon(
                      Icons.search_rounded,
                      color: Colors.grey,
                      size: 32,
                    ),
                  ),
                ],
              ),
            ),
          ),
          TextTitle(
            txtt: 'Categories'.tr,
            onPressed: () {
              Get.toNamed(AppRoutes.fullCategories);
            },
          ),
          const CategoriesBuilder(
            images: [
              'assets/svg/implant.svg',
              'assets/svg/implant.svg',
              'assets/svg/implant.svg',
              'assets/svg/implant.svg',
              'assets/svg/implant.svg',
              'assets/svg/implant.svg',
              'assets/svg/implant.svg',
            ],
            txt: [
              'Gumboil',
              'Gingivitis',
              'Edentulous',
              'Displaced tooth',
              'Dental abscess',
              'Orthodontics',
              'Caries',
              'Endodontics',
              'Prosthodontic',
              'Implantology',
              'General',
            ],
            itemCount: 6,
            color: [
              Color(0xff526FA6),
              Color(0xFF103579),
              Color(0xff526FA6),
              Color(0xFF103579),
              Color(0xff526FA6),
              Color(0xFF103579),
              Color(0xff526FA6),
              Color(0xFF103579),
              Color(0xff526FA6),
              Color(0xFF103579),
              Color(0xff526FA6),
            ],
          ),
          TextTitle(
            txtt: 'Appointments',
            onPressed: () {Get.to(const AppointmentFullScreen());},
          ),
          // const AppointmentCardWidget(),
          TextTitle(
              txtt: 'General Cases'.tr,
              onPressed: () {
                Get.toNamed(AppRoutes.unassignedCasesDoctor);
              }),
                // GetBuilder<UnassignedCasesDoctorControllerImpl>(
                //     builder: (controller) {
                //   if (controller.requestStatus == RequestStatus.SUCCESS) {
                //     return const Expanded(child: FormView());
                //   } else if (controller.requestStatus ==
                //       RequestStatus.LOADING) {
                //     return const Expanded(child: ShimmerList());
                //   } else if (controller.requestStatus ==
                //       RequestStatus.EMPTY_SUCCESS) {
                //     return Center(
                //       child: Column(
                //         children: [
                //           SizedBox(
                //             height: 350,
                //             width: 270,
                //             child:
                //                 SvgPicture.asset('assets/svg/Empty-pana.svg'),
                //           ),
                //         ],
                //       ),
                //     );
                //   } else {
                //     return Center(
                //       child: Padding(
                //         padding: const EdgeInsets.only(top: 30),
                //         child: Column(
                //           children: [
                //             SizedBox(
                //               height: 350,
                //               width: 270,
                //               child:
                //                   SvgPicture.asset('assets/svg/GroupRRR.svg'),
                //             ),
                //           ],
                //         ),
                //       ),
                //     );
                //   }
                // }),
              ],
            ),
          ),
        ],
      ),
      // ListView(
      //   padding: const EdgeInsets.only(top: 0),
      //   children: [
      //     Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         const AppUpperWidget(),
      //         const SizedBox(
      //           height: 10,
      //         ),
      //         IconButton(
      //           onPressed: () {
      //             Get.toNamed(AppRoutes.searchCasesScreen);
      //           },
      //           icon: Container(
      //             padding: const EdgeInsets.all(10),
      //             alignment: Alignment.centerLeft,
      //             width: double.infinity,
      //             decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(20),
      //                 color: const Color.fromARGB(94, 183, 181, 181)),
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 Flexible(
      //                   child: Text(
      //                     "Search".tr,
      //                     style: Styles.textStyle16.copyWith(
      //                         color: Colors.grey, fontWeight: FontWeight.w700),
      //                   ),
      //                 ),
      //                 const Flexible(
      //                   child: Icon(
      //                     Icons.search_rounded,
      //                     color: Colors.grey,
      //                     size: 32,
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //         TextTitle(
      //           txtt: 'Categories',
      //           onPressed: () {
      //             Get.toNamed(AppRoutes.fullCategories);
      //           },
      //         ),
      //         const CategoriesBuilder(
      //           images: [
      //             'assets/svg/implant.svg',
      //             'assets/svg/implant.svg',
      //             'assets/svg/implant.svg',
      //             'assets/svg/implant.svg',
      //             'assets/svg/implant.svg',
      //             'assets/svg/implant.svg',
      //             'assets/svg/implant.svg',
      //           ],
      //           txt: [
      //             'Gumboil',
      //             'Gingivitis',
      //             'Edentulous',
      //             'Displaced tooth',
      //             'Dental abscess',
      //             'Orthodontics',
      //             'Caries',
      //             'Endodontics',
      //             'Prosthodontic',
      //             'Implantology',
      //             'General',
      //           ],
      //           itemCount: 6,
      //           color: [
      //             Color(0xff526FA6),
      //             Color(0xFF103579),
      //             Color(0xff526FA6),
      //             Color(0xFF103579),
      //             Color(0xff526FA6),
      //             Color(0xFF103579),
      //             Color(0xff526FA6),
      //             Color(0xFF103579),
      //             Color(0xff526FA6),
      //             Color(0xFF103579),
      //             Color(0xff526FA6),
      //           ],
      //         ),
      //         TextTitle(
      //           txtt: 'Appointments',
      //           onPressed: () {},
      //         ),
      //         const AppointmentCardWidget(),
      //         TextTitle(
      //             txtt: 'General Cases',
      //             onPressed: () {
      //               Get.toNamed(AppRoutes.unassignedCasesDoctor);
      //             }),
      //         const SizedBox(
      //           height: 100,
      //         ),

      //       ],
      //     ),
      //   ],
      // ),
    );
  }
}
