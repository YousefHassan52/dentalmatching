import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'categories_container.dart';

class CategoriesBuilder extends StatelessWidget {
  const CategoriesBuilder(
      {super.key,
      required this.images,
      required this.txt,
      required this.itemCount,
      required this.color});
  final List<String> images;
  final List<String> txt;
  final List<Color> color;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(top: 0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        //mainAxisExtent: 90,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
      ),
      itemCount: itemCount, //3delo lma ndef ba2y
      itemBuilder: (context, index) {
        return CategoriesContainer(
          img: images[index],
          txt: txt[index].tr,
          color: color[index],
        );
      },
    );
  }
}
