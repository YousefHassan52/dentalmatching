import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CentImg extends StatelessWidget {
  final String centeredImg;
  const CentImg({
    super.key,
    required this.centeredImg,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.8,
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: SvgPicture.asset(centeredImg),
      ),
    );
  }
}
