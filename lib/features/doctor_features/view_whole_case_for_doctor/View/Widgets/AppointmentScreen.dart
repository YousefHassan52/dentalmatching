import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/functions/validator.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/controller/unassigned_cases_doctor_controller_impl.dart';
import 'package:dentalmatching/features/doctor_features/get_doctor_cases/controller/get_doctor_cases_controller_impl.dart';
import 'package:dentalmatching/features/doctor_features/view_whole_case_for_doctor/View/Widgets/google_map_link_textformfield.dart';
import 'package:dentalmatching/features/doctor_features/view_whole_case_for_doctor/controller/AppointmentController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class AppointmentScreen extends StatelessWidget {
  final AppointmentController appointmentController =
      Get.put(AppointmentController());

  AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.7, // Adjust this value as needed
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Form(
            key: appointmentController.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Appointment',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                GestureDetector(
                  onTap: () => appointmentController.selectDate(context),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: GetBuilder<AppointmentController>(
                      builder: (controller) => const FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.calendar_today),
                            SizedBox(width: 10),
                            Text(
                              'Select Data',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => appointmentController.selectTime(context),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: GetBuilder<AppointmentController>(
                      builder: (controller) => const FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.access_time),
                            SizedBox(width: 10),
                            Text(
                              'Select time',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // GetBuilder<AppointmentController>(
                //   builder: (controller) => Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       const Icon(Icons.access_time),
                //       const SizedBox(width: 10),
                //       Text(
                //         'Appointment booked for: ${appointmentController.selectedTime.hour}:${appointmentController.selectedTime.minute}',
                //         style: const TextStyle(fontSize: 20),
                //       ),
                //     ],
                //   ),
                // ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: MapLinkTextFormField(
                      type: TextInputType.url,
                      validator: (value) {
                        return AppValidator.textFormFieldValidator(
                            value!, "link");
                      },
                      fieldController:
                          appointmentController.linkTextController),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                          child: IconButton(
                        icon: const Text("Google Map App"),
                        onPressed: () async {
                          final Uri _url =
                              Uri.parse('https://www.google.com/maps');
                          if (!await launchUrl(_url)) {
                            throw Exception('Could not launch $_url');
                          }
                        },
                      )),
                      Expanded(
                          child: IconButton(
                        icon: const Text("hint video"),
                        onPressed: () {},
                      )),
                    ],
                  ),
                ),

                ElevatedButton(
                  onPressed: () {
                    appointmentController.bookCase();
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(AppColors.mainColor),
                  ),
                  child: const Text(
                    'Book',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ), // Background color red
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
