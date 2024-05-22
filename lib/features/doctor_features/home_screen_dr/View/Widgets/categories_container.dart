import 'package:dentalmatching/core/constants/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CategoriesContainer extends StatelessWidget {
  const CategoriesContainer({
    super.key,
    required this.img,
    required this.txt,
    required this.color,
  });

  final String img;
  final String txt;
  final Color color;

  @override
  Widget build(BuildContext context) {
    // Set the maximum length for the text before truncating
    const int maxLength = 10;
    // Check if the text length exceeds the maximum length and truncate if necessary
    final String displayTxt = txt.length > maxLength ? '${txt.substring(0, maxLength)}...' : txt;

    return IconButton(
      onPressed: () {
        if (txt == "General") {
          Get.toNamed(AppRoutes.unassignedCasesDoctor);
        } else {
          Get.toNamed(AppRoutes.categoryCasesScreen,
              arguments: {"category": txt});
        }
      },
      icon: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(26)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3), // Shadow color
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: SizedBox(
                height: 55,
                width: 45,
                child: SvgPicture.asset(img),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    displayTxt,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
