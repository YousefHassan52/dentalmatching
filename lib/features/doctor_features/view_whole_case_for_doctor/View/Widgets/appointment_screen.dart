import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/functions/validator.dart';
import 'package:dentalmatching/features/doctor_features/view_whole_case_for_doctor/View/Widgets/google_map_link_textformfield.dart';
import 'package:dentalmatching/features/doctor_features/view_whole_case_for_doctor/controller/AppointmentController.dart';

class AppointmentScreen extends StatelessWidget {
  final AppointmentController appointmentController =
      Get.put(AppointmentController());

  AppointmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Form(
            key: appointmentController.formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Appointment'.tr,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
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
                                  if (appointmentController.selectedDate ==
                                      null)
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.calendar_today,
                                            color: Colors.white),
                                        const SizedBox(width: 10),
                                        Text(
                                          'Select Date'.tr,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  if (appointmentController.selectedDate !=
                                      null)
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.calendar_today,
                                            color: Colors.white),
                                        const SizedBox(width: 10),
                                        Text(
                                          'Selected Date: '.tr +
                                              DateFormat.yMd().format(
                                                  appointmentController
                                                      .selectedDate!),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [
                        const Text(
                          'Select Available Time',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        GetBuilder<AppointmentController>(
                          builder: (controller) => Wrap(
                            spacing: 6,
                            runSpacing: 5.0,
                            children: appointmentController.availableTimes
                                .map((time) {
                              final isSelected = time ==
                                  appointmentController.selectedAvailableTime;
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: ChoiceChip(
                                  label: Text(
                                    '${time.format(context)} - ${time.replacing(hour: time.hour + 1).format(context)}',
                                    style: const TextStyle(
                                        fontSize:
                                            14), // Adjust the font size as needed
                                  ),
                                  selected: isSelected,
                                  onSelected: (selected) {
                                    if (selected) {
                                      appointmentController
                                          .selectAvailableTime(time);
                                    }
                                  },
                                  selectedColor: AppColors.mainColor,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    child: MapLinkTextFormField(
                      type: TextInputType.text,
                      validator: (value) {
                        return AppValidator.textFormFieldValidator(
                            value!, "location");
                      },
                      fieldController: appointmentController.linkTextController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          appointmentController.bookCase();
                          Get.back();
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              AppColors.mainColor),
                        ),
                        child: Text(
                          'Book Appointment'.tr,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
