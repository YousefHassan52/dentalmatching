import 'package:dentalmatching/features/doctor_features/HomaPageDr/View/Widgets/CategoriesContainer.dart';
import 'package:flutter/material.dart';

class CategoriesBuilder extends StatelessWidget {
  const CategoriesBuilder({super.key, required this.images, required this.txt});
  final List<String> images;
  final List<String> txt;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(top: 0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisExtent: 100,
        crossAxisSpacing: 6,
        mainAxisSpacing: 0,
      ),
      itemCount: 6, //3delo lma ndef ba2y
      itemBuilder: (context, index) {
        return CategoriesContainer(
          img: images[index],
          txt: txt[index],
        );
      },
    );
  }
}
