import 'package:dentalmatching/core/constants/styles.dart';
import 'package:flutter/material.dart';

class ChronicList extends StatelessWidget {
   final List<String> chronicDiseases = [
    'Diabetes',
    'Hypertension',
    'Heart Disease',
    'Cancer',
  ];
    ChronicList({super.key});

  @override
  Widget build(BuildContext context) {
  
    return  Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: chronicDiseases
              .map((disease) => Text(
                    disease,
                    style: Styles.descripativeText,
                  ))
              .toList(),
        ),
      );
  }
}