import 'package:dentalmatching/core/constants/routes_names.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/features/doctor_features/HomaPageDr/View/Widgets/AppointmentCardWidget.dart';
import 'package:dentalmatching/features/doctor_features/HomaPageDr/View/Widgets/Categories.dart';
import 'package:dentalmatching/features/doctor_features/HomaPageDr/View/Widgets/TextTitle.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/View/Widget/AppUpper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageDr extends StatelessWidget {
  const HomePageDr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(top: 0),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      color: Colors.grey),
                  child: FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.search_rounded,
                          color: Colors.white,
                          size: 32,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Search",
                          style:
                              Styles.textStyle16.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              TextTitle(
                txtt: 'Categories',
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
                onPressed: () {},
              ),
              const AppointmentCardWidget(),
              TextTitle(
                  txtt: 'General Cases',
                  onPressed: () {
                    Get.toNamed(AppRoutes.unassignedCasesDoctor);
                  }),
              SizedBox(
                height: 100,
              )
            ],
          ),
        ],
      ),
    );
  }
}
