import 'package:dentalmatching/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentController extends GetxController {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
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
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      update();
    }
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
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
    print('Appointment booked for: ${selectedTime.hour}:${selectedTime.minute}');
  }
  void updateSelectedTime(TimeOfDay time) {
    selectedTime = time;
    update(); // Notify listeners about the change
  }
}
