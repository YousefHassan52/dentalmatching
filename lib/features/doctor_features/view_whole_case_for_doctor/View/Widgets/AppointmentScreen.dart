import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/features/doctor_features/view_whole_case_for_doctor/controller/AppointmentController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentScreen extends StatelessWidget {
  final AppointmentController appointmentController =
      Get.put(AppointmentController());

  AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.5, // Adjust this value as needed
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
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
                    builder: (controller) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.calendar_today),
                        const SizedBox(width: 10),
                        Text(
                          'Date: ${controller.selectedDate.year}-${controller.selectedDate.month}-${controller.selectedDate.day}',
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => appointmentController.selectTime(context),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: GetBuilder<AppointmentController>(
                    builder: (controller) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.access_time),
                        const SizedBox(width: 10),
                        Text(
                          'Time: ${controller.selectedTime.hour}:${controller.selectedTime.minute}',
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
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
              ElevatedButton(
                onPressed: () {
                  appointmentController.bookAppointment();
                  print(
                      'Appointment booked for: ${appointmentController.selectedTime.hour}:${appointmentController.selectedTime.minute}');
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
            ],
          ),
        ),
      ),
    );
  }
}
