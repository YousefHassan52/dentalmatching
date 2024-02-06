
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:flutter/material.dart';

class HDivider extends StatelessWidget {
  const HDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child:  SizedBox(
      width: 250,
      height: 10,
      child: Divider(
        color: AppColors.mainColor,
        thickness: 2,
        // indent: 20,
      ),
                ),
    );
  }
}
