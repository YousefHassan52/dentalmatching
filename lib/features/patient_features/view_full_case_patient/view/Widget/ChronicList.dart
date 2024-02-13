import 'package:dentalmatching/core/constants/styles.dart';
import 'package:flutter/material.dart';

class ChronicOrDentalList extends StatelessWidget {
  final List<String> chronicDiseases = [
    'Diabetes',
    'Hypertension',
    'Heart Disease',
    'Cancer',
  ];
  ChronicOrDentalList({super.key, required this.list});
  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: list
            .map((disease) => Text(
                  disease,
                  style: Styles.textStyle16Grey,
                ))
            .toList(),
      ),
    );
  }
}
