import 'package:dentalmatching/features/doctor_features/HomaPageDr/View/Widgets/AppointmentCardWidget.dart';
import 'package:dentalmatching/features/doctor_features/HomaPageDr/View/Widgets/Categories.dart';
import 'package:dentalmatching/features/doctor_features/HomaPageDr/View/Widgets/TextTitle.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/View/Widget/AppUpper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageDr extends StatelessWidget {
  const HomePageDr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(top: 0),
        children: const [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppUpperWidget(),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: CupertinoSearchTextField(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                ),
              ),
              TextTitle(txtt: 'Categories'),
              CategoriesBuilder(
                images: [
                  'assets/svg/implant.svg',
                  'assets/svg/implant.svg',
                  'assets/svg/implant.svg',
                  'assets/svg/implant.svg',
                  'assets/svg/implant.svg',
                  'assets/svg/implant.svg'
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
                ],
              ),
              TextTitle(
                txtt: 'Appointments',
              ),
              AppointmentCardWidget(),
              TextTitle(
                txtt: 'General Cases',
              ),
              
            ],
          ),
        ],
      ),
    );
  }
}
