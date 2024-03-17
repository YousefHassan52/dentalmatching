import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/View/Widget/AppUpper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../HomaPageDr/View/Widgets/Categories.dart';

class FullCategories extends StatelessWidget {
  const FullCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppUpperWidget(
              needBackButton: true,
              welcome: false,
              text: 'All Categories         ',
            ),
            SizedBox(height: 20,),
            CategoriesBuilder(
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
