import 'package:flutter/material.dart';

class ChronicList extends StatelessWidget {
  final List<String> chronicDiseases = [
    'Diabetes',
    'Hypertension',
    'Heart Disease',
    'Cancer',
  ];
  ChronicList({super.key, required this.list});
  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: list
            .map((disease) => Text(
                  disease,
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                ))
            .toList(),
      ),
    );
  }
}
