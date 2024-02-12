
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoxWidget extends StatelessWidget {
  final Widget widget;
  const BoxWidget({
    super.key, required this.widget, 
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.circleColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColors.blueLightTextColor.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 3,
            ),
          ],
        ),
        child:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: widget
        ),
      ),
    );
  }
}
