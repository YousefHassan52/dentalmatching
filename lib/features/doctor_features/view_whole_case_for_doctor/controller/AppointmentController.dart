import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/features/doctor_features/view_whole_case_for_doctor/controller/view_whole_case_doctor_controller_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AppointmentController extends GetxController {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  late TextEditingController linkTextController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    linkTextController = TextEditingController();
    super.onInit();
  }

Future<void> selectDate(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: selectedDate,
    firstDate: DateTime.now(),
    lastDate: DateTime(2101),
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: ThemeData.light().copyWith(
          colorScheme: const ColorScheme.light(
            primary: AppColors.mainColor,
          ),
          // Add more customization if needed
        ),
        child: child!,
      );
    },
  );
  if (picked != null && picked != selectedDate) {
    selectedDate = picked;
    update();
  }
}


  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            colorScheme: const ColorScheme.light(
              primary: AppColors.mainColor,
            ),
            // More customization if needed
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      updateSelectedTime(picked); // Update selectedTime
    }
  }

  void bookAppointment() {
    // Perform booking logic here, such as saving selectedDate and selectedTime
    // For demonstration purposes, I'll just print the selected time
    if (selectedDate != null && selectedTime != null) {
      print(
          'Appointment booked for: ${selectedTime!.hour}:${selectedTime!.minute}');
    }
  }

  void updateSelectedTime(TimeOfDay time) {
    selectedTime = time;
    update(); // Notify listeners about the change
  }

  Future<void> bookCase() async {
    if (formKey.currentState!.validate() &&
        selectedTime != null &&
        selectedDate != null) {
      ViewWholeCaseDoctorControllerImpl controller = Get.find();
      String time =
          "${DateFormat('yyyy-MM-dd').format(selectedDate!)}T${selectedTime!.hour < 10 ? '0${selectedTime!.hour}' : selectedTime!.hour}:${selectedTime!.minute < 10 ? '0${selectedTime!.minute}' : selectedTime!.minute}";

      controller.requestCase(
          time: time, googleMapLink: linkTextController.text);
      selectedDate = null;
      selectedTime = null;
    } else {
      Get.defaultDialog(
        title: 'Error'.tr,
        middleText:"Choose Date and Time".tr,);
      Get.snackbar("Error".tr, "Choose date");
    }
  }
}
