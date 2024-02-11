import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:flutter/material.dart';

class RadioListWidget extends StatelessWidget {
  final List cont;
  final void Function(dynamic)? onChanged;
  final dynamic groupValue;
  const RadioListWidget(
      {super.key,
      required this.cont,
      required this.onChanged,
      required this.groupValue});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var iterator in cont)
          Column(
            children: [
              RadioListTile(
                activeColor: AppColors.mainColor,
                title: Text(
                  iterator,
                  style: Styles.textStyle16Grey,
                ),
                value: iterator,
                groupValue: groupValue,
                onChanged: onChanged,
              ),
            ],
          ),
      ],
    );
  }
}
