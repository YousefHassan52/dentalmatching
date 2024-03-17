import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoriesContainer extends StatelessWidget {
  const CategoriesContainer({
    super.key,
    required this.img,
    required this.txt,
  });
  final String img;
  final String txt;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Container(
        width: 100,
        height: 90,
        decoration: const BoxDecoration(
          color: Color(0xff526FA6),
          borderRadius: BorderRadius.all(Radius.circular(26)),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 55,
              width: 45,
              child: SvgPicture.asset(img),
            ),
            Flexible(
              child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(txt,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w300)),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
