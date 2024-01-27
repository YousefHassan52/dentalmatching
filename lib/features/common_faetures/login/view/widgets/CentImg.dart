
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CentImg extends StatelessWidget {
  final String Centeredimg;
  const CentImg({
    super.key, required this.Centeredimg,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      width: 600,
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: SvgPicture.asset(Centeredimg),
      ),
    );
  }
}