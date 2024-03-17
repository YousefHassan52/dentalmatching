import 'package:dentalmatching/core/constants/routes_names.dart';
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
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CupertinoSearchTextField(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
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
                itemCount: 6,  color: [
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
              const TextTitle(
                txtt: 'Appointments',
              ),
              const AppointmentCardWidget(),
              const TextTitle(
                txtt: 'General Cases',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
