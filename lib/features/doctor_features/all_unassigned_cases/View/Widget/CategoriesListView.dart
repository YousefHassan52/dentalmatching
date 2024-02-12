import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/data/Model/CategoriesModel.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/View/Widget/CatigoriesWidget.dart';
import 'package:flutter/cupertino.dart';

class CategoriesListView extends StatelessWidget {
  CategoriesListView({super.key});
  final List<CategoriesModel> categories = [
    CategoriesModel('Implant', icon: 'assets/svg/implant.svg'),
    CategoriesModel('Implant', icon: 'assets/svg/implant.svg'),
    CategoriesModel('Implant', icon: 'assets/svg/implant.svg'),
    CategoriesModel('Implant', icon: 'assets/svg/implant.svg'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoriesWidget(
            model: categories[index],
          );
        },
      ),
    );
  }
}
