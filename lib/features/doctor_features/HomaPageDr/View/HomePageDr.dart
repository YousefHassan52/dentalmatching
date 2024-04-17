import 'package:dentalmatching/core/constants/routes_names.dart';
import 'package:dentalmatching/core/constants/styles.dart';

import 'package:dentalmatching/features/doctor_features/HomaPageDr/View/Widgets/Categories.dart';
import 'package:dentalmatching/features/doctor_features/HomaPageDr/View/Widgets/TextTitle.dart';
import 'package:dentalmatching/features/doctor_features/HomaPageDr/View/Widgets/three_cases_list.dart';
import 'package:dentalmatching/features/doctor_features/HomaPageDr/controller/get_three_cases_controller_imp.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/View/Widget/AppUpper.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomePageDr extends StatelessWidget {
  const HomePageDr({super.key});

  @override
  Widget build(BuildContext context) {
    GetThreeCasesControllerImpl externalController =
        Get.put(GetThreeCasesControllerImpl());

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(top: 0),
        children: [
          SizedBox(
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
                                color: Colors.grey,
                                fontWeight: FontWeight.w700),
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
                // TextTitle(
                //   txtt: 'Appointments',
                //   onPressed: () {
                //     Get.to(const AppointmentFullScreen());
                //   },
                // ),
                // const AppointmentCardWidget(),
                TextTitle(
                    txtt: 'General Cases'.tr,
                    onPressed: () {
                      Get.toNamed(AppRoutes.unassignedCasesDoctor);
                    }),
                ThreeCasesList(),
                SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
