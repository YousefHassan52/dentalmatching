import 'package:dentalmatching/features/doctor_features/home_screen_dr/View/Widgets/time_row.dart';
import 'package:flutter/material.dart';

class AppointmentContainer extends StatelessWidget {
  const AppointmentContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 1, 27, 83),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              TimeRow(
                time: 'Mondey 12/3/2024',
                icon: Icons.calendar_month_outlined,
              ),
              TimeRow(time: '2:00 AM', icon: Icons.access_alarm_outlined),
            ],
          ),
        ),
      ),
    );
  }
}
