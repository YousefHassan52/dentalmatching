import 'package:dentalmatching/core/constants/routes_names.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/features/doctor_features/home_screen_dr/View/widgets/time_row.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/data/Model/CaseDoctorModel.dart';
import 'package:dentalmatching/features/doctor_features/view_whole_case_for_doctor/view/widgets/date_time_widget.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/view/Widgets/circle_avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentCardWidget extends StatelessWidget {
  const AppointmentCardWidget({
    Key? key,
    required this.caseModel,
  }) : super(key: key);
  final CaseDoctorModel caseModel;
  @override
  Widget build(BuildContext context) {
    MyServices languageController = Get.find();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      //height: 320,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Color(0xFF103579),
          borderRadius: BorderRadius.all(Radius.circular(20))),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 50,
                child: CircleAvatarWidget(imagePath: 'assets/svg/pp.svg'),
              ),
              Flexible(
                flex: 4,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    caseModel.patientName,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              if (caseModel.isAssigned == true)
                const Icon(
                  Icons.check_circle_rounded,
                  color: Colors.green,
                ),
              const Spacer(),
              Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: IconButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.viewWholeCaseForDoctor,
                          arguments: {"case": caseModel});
                    },
                    icon:
                        languageController.sharedPref.getString("lang") == "en"
                            ? const Icon(
                                Icons.keyboard_double_arrow_right_outlined,
                                color: Colors.white,
                              )
                            : const Icon(
                                Icons.keyboard_double_arrow_left_outlined,
                                color: Colors.white,
                              ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 1, 27, 83),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TimeRow(
                      time: formatDate(caseModel.appointmentDateTime!),
                      icon: Icons.calendar_month_outlined,
                    ),
                    TimeRow(
                        time: formatTime(caseModel.appointmentDateTime!),
                        icon: Icons.access_alarm_outlined),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
