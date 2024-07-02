import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/view/widget/app_upper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home_screen_dr/view/widgets/categories.dart';

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
                'assets/svg/cavity.svg',
                'assets/svg/crown-alt.svg',
                'assets/svg/implant.svg',
                'assets/svg/implant.svg',
                'assets/svg/braces.svg',
                'assets/svg/tooth-loosen.svg',
                'assets/svg/asaab.svg',
                'assets/svg/khorag.svg',
                'assets/svg/bracesT.svg',
              ],
              txt: [
                'Caries',
                'Fixed Prosthodontics Crown and Bridge',
                'Fixed Prosthodontics Implantology',
                'Partial Removable Prosthodontics',
                'Orthodontics',
                'Gingivitis - periodontitis',
                'Endodontics',
                'Dental abscess',
                'Complete Removable Prosthodontics',
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
              itemCount: 9,
            ),
          ],
        ),
      ),
    );
  }
}
