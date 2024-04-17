import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/functions/validator.dart';
import 'package:dentalmatching/features/doctor_features/view_whole_case_for_doctor/View/Widgets/google_map_link_textformfield.dart';
import 'package:dentalmatching/features/doctor_features/view_whole_case_for_doctor/controller/AppointmentController.dart';
import 'package:flutter/material.dart';
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
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                ),
                // GestureDetector(
                //   onTap: () => appointmentController.selectDate(context),
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(vertical: 20),
                //     child: GetBuilder<AppointmentController>(
                //       builder: (controller) => FittedBox(
                //         fit: BoxFit.scaleDown,
                //         child: Container(
                //           decoration: BoxDecoration(
                //             color: AppColors.mainColor,
                //             borderRadius: BorderRadius.circular(25),
                //             boxShadow: [
                //               BoxShadow(
                //                 color: Colors.grey
                //                     .withOpacity(0.5), // Color of the shadow
                //                 spreadRadius: 5, // Spread radius
                //                 blurRadius: 7, // Blur radius
                //                 offset:
                //                     const Offset(0, 3), // Offset of the shadow
                //               ),
                //             ],
                //           ),
                //           child: const Padding(
                //             padding: EdgeInsets.all(8.0),
                //             child: Row(
                //               mainAxisAlignment: MainAxisAlignment.center,

                //               children: [
                //                 Icon(Icons.calendar_today, color: Colors.white),
                //                 SizedBox(width: 10),
                //                 Text(
                //                   'Select Data',
                //                   style: TextStyle(
                //                     fontSize: 20,
                //                     color: Colors.white,
                //                   ),
                //                 ),
                //               ],
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                GestureDetector(
                  onTap: () => appointmentController.selectDate(context),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: GetBuilder<AppointmentController>(
                      builder: (controller) => FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                if (appointmentController.selectedTime == null)
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.calendar_today,
                                          color: Colors.white),
                                      SizedBox(width: 10),
                                      Text(
                                        'Select Date',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                // Display selected date
                                if (appointmentController.selectedDate != null)
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.calendar_today,
                                          color: Colors.white),
                                      const SizedBox(width: 10),
                                      Text(
                                        'Selected Date: ${DateFormat.yMd().format(appointmentController.selectedDate!)}',
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
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
                      builder: (controller) => FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey
                                    .withOpacity(0.5), // Color of the shadow
                                spreadRadius: 5, // Spread radius
                                blurRadius: 7, // Blur radius
                                offset:
                                    const Offset(0, 3), // Offset of the shadow
                              ),
                            ],
                          ),
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  if (appointmentController.selectedTime ==
                                      null)
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.access_time,
                                          color: Colors.white,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          'Select time',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  // Display selected time
                                  if (appointmentController.selectedTime !=
                                      null)
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.access_time,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          'Selected Time: ${appointmentController.selectedTime!.format(context)}',
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                ],
                              )),
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey
                                    .withOpacity(0.5), // Color of the shadow
                                spreadRadius: 5, // Spread radius
                                blurRadius: 7, // Blur radius
                                offset:
                                    const Offset(0, 3), // Offset of the shadow
                              ),
                            ],
                          ),
                          child: IconButton(
                            icon: const Text(
                              "Google Maps",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () async {
                              final Uri _url =
                                  Uri.parse('https://www.google.com/maps');
                              if (!await launchUrl(_url)) {
                                throw Exception('Could not launch $_url');
                              }
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey
                                    .withOpacity(0.5), // Color of the shadow
                                spreadRadius: 5, // Spread radius
                                blurRadius: 7, // Blur radius
                                offset:
                                    const Offset(0, 3), // Offset of the shadow
                              ),
                            ],
                          ),
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.info_outline,
                                color: Color.fromARGB(255, 213, 212, 212),
                              )),
                        ),
                      )
                    ],
                  ),
                ),
                // Container(
                //   width: double.infinity,
                //   padding: const EdgeInsets.all(16),
                //   child: Row(
                //     children: [
                //       Expanded(
                //           child: IconButton(
                //         icon: const Text("Google Map App"),
                //         onPressed: () async {
                //           final Uri _url =
                //               Uri.parse('https://www.google.com/maps');
                //           if (!await launchUrl(_url)) {
                //             throw Exception('Could not launch $_url');
                //           }
                //         },
                //       )),
                //       Expanded(
                //           child: IconButton(
                //         icon: const Text("hint video"),
                //         onPressed: () {},
                //       )),
                //     ],
                //   ),
                // ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      appointmentController.bookCase();
                      Get.back();
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
