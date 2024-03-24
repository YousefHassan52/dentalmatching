
import 'package:dentalmatching/features/patient_features/view_full_case_patient/controller/view_full_case_patient_controller_impl.dart';
import 'package:flutter/material.dart';

class DateTimePatientWidget extends StatelessWidget {
  const DateTimePatientWidget({
    super.key,
    required this.controller, required this.txt, required this.text,
  });

  final ViewFullCasePatientControllerImpl controller;
  final String txt;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Flexible(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              text,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 20),
            ),
          ),
        ),
        Flexible(
          flex: 2,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(txt,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 20)),
          ),
        ),
      ],
    );
  }
}


  String formatDate(String dateTimeString) {
    final dateTime = DateTime.parse(dateTimeString);
    final formattedDate = '${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}';
    return formattedDate;
  }
 
String formatTime(String dateTimeString) {
  final dateTime = DateTime.parse(dateTimeString);
  final hour = dateTime.hour > 12 ? dateTime.hour - 12 : dateTime.hour;
  final minute = dateTime.minute.toString().padLeft(2, '0');
  final period = dateTime.hour >= 12 ? 'PM' : 'AM';
  final formattedTime = '$hour:$minute $period';
  return formattedTime;
}