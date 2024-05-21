import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/View/Widget/app_upper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home_screen_dr/View/Widgets/categories.dart';

class FullCategories extends StatelessWidget {
  const FullCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppUpperWidget(
              needBackButton: true,
              welcome: false,
              text: "All Categories".tr,
            ),
            const SizedBox(
              height: 20,
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
                'General'
              ],
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
              itemCount: 11,
            ),
          ],
        ),
      ),
    );
  }
}
