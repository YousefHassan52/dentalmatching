// ignore_for_file: avoid_print

import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/functions/handling_response_type.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/core/shared/dialogue_without_buttons.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/data/Model/CaseDoctorModel.dart';
import 'package:dentalmatching/features/doctor_features/signup/data/models/doctor_model.dart';
import 'package:dentalmatching/features/doctor_features/view_whole_case_for_doctor/controller/view_whole_case_doctor_controller_impl.dart';
import 'package:dentalmatching/features/doctor_features/view_whole_case_for_doctor/data/request_case_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AppointmentController extends GetxController {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  late TextEditingController linkTextController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  MyServices myServices = Get.find();
  late DoctorModel doctorModel =
      DoctorModel.fromSharedPref(myServices.sharedPref);
  late CaseDoctorModel caseModel;
  bool viewPhone = false;
  RequestCaseData data = RequestCaseData(Get.find());
  RequestStatus? requestStatus;

  // List of available times from 8 AM to 9 PM with one hour intervals
  List<TimeOfDay> availableTimes = List.generate(
    14,
    (index) => TimeOfDay(hour: 8 + index, minute: 0),
  );
  List<TimeOfDay> timesSendtoApi = List.generate(
    14,
    (index) => TimeOfDay(hour: 8 + index, minute: 0),
  );
  TimeOfDay? selectedAvailableTime;

  @override
  void onInit() {
    linkTextController = TextEditingController();
    super.onInit();
  }

  List<String> formatAvailableTimes() {
    return timesSendtoApi.map((time) {
      String formattedHour = time.hour.toString().padLeft(2, '0');
      String formattedMinute = time.minute.toString().padLeft(2, '0');
      String formattedSecond = "00"; // Assuming seconds are always "00"
      return "$formattedHour:$formattedMinute:$formattedSecond";
    }).toList();
  }

  void selectAvailableTime(TimeOfDay? time) {
    if (time != null) {
      selectedAvailableTime = time;

      String formattedHour =
          selectedAvailableTime!.hour.toString().padLeft(2, '0');
      String formattedMinute =
          selectedAvailableTime!.minute.toString().padLeft(2, '0');
      String formattedSecond = "00"; // Assuming seconds are always "00"

      String formattedTime = "$formattedHour:$formattedMinute:$formattedSecond";
      print(formattedTime);

      update();
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.blue,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      String selectedDateApi = DateFormat('yyyy-MM-dd').format(selectedDate!);
      List<String> formattedTimes = formatAvailableTimes();
      print(selectedDateApi); // for debugging
      print(formattedTimes); // for debugging
      sendDay(selectedDateApi: selectedDateApi, formattedTimes: formattedTimes);
      update();
    }
  }

  void sendDay(
      {required String selectedDateApi,
      required List<String> formattedTimes}) async {
    requestStatus = RequestStatus.LOADING;
    update();

    var response = await data.appointmentTime(
        token: doctorModel.token, date: selectedDateApi, times: formattedTimes);
    print(response.toString());
    update();

    requestStatus = HandlingResponseType.fun(response);
    print("joe ;${requestStatus.toString()}");

    if (requestStatus == RequestStatus.SUCCESS) {
      if (response["success"] == true) {
        availableTimes=[];
        List<dynamic> responseData = response["data"]["times"];
        for (var timeString in responseData) {
          List<String> timeParts = timeString.split(":");
          int hour = int.parse(timeParts[0]);
          int minute = int.parse(timeParts[1]);
          availableTimes.add(TimeOfDay(hour: hour, minute: minute));
        }
      }
    } else if (requestStatus == RequestStatus.UNAUTHORIZED_FAILURE) {
      customDialoge(
          title: "Try Again".tr,
          middleText: "Internet Connection Error Refresh Data ");
    } else {
      customDialoge(
          title: "Try Again".tr, middleText: "Server Error Please Try Again");
    }

    update();
  }

  void bookAppointment() {
    if (selectedDate != null && selectedAvailableTime != null) {
      print(
          'Appointment booked for: ${selectedAvailableTime!.format(Get.context!)}');
    }
  }

  Future<void> bookCase() async {
    if (formKey.currentState!.validate() &&
        selectedAvailableTime != null &&
        selectedDate != null) {
      ViewWholeCaseDoctorControllerImpl controller = Get.find();
      String time =
          "${DateFormat('yyyy-MM-dd').format(selectedDate!)}T${selectedAvailableTime!.hour < 10 ? '0${selectedAvailableTime!.hour}' : selectedAvailableTime!.hour}:${selectedAvailableTime!.minute < 10 ? '0${selectedAvailableTime!.minute}' : selectedAvailableTime!.minute}";

      controller.requestCase(
          time: time, googleMapLink: linkTextController.text);
      selectedDate = null;
      selectedAvailableTime = null;
      print("Timeeee $time");
    } else {
      customDialoge(
        title: 'Error'.tr,
        middleText: "Choose Date and Time".tr,
      );
      Get.snackbar("Error".tr, "Choose date");
    }
  }
}
