
import 'package:dentalmatching/features/doctor_features/HomaPageDr/View/Widgets/AppointmentContainer.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/view/Widgets/CircleAvatarWidget.dart';
import 'package:flutter/material.dart';

class AppointmentCardWidget extends StatelessWidget {
  const AppointmentCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        onTap: (){},
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Color(0xFF103579),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Flexible(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: SizedBox(
                          height: 40,
                          width: 55,
                          child: CircleAvatarWidget(
                              imagePath: 'assets/svg/profile.svg'),
                        ),
                      ),
                    ),
                    Flexible(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'Hajar Abdelhamed',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const AppointmentContainer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      child: FittedBox(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(
                                    Colors.red),
                          ),
                          child: const Text(
                            'Cancel',
                            style: TextStyle(color: Colors.white),
                          ), // Background color red
                        ),
                      ),
                    ),
                    Flexible(
                      child: FittedBox(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(
                                    const Color.fromARGB(
                                        255, 122, 222, 125)),
                          ),
                          child: const Text(
                            'Complete',
                            style: TextStyle(color: Colors.white),
                          ), // Background color red
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
