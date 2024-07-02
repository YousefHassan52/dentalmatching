// ignore_for_file: avoid_print

import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/functions/block_action.dart';
import 'package:dentalmatching/core/functions/handling_response_type.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/features/common_faetures/notifications/controller/abstract_controller.dart';
import 'package:dentalmatching/features/common_faetures/notifications/data/notification_data.dart';
import 'package:dentalmatching/features/patient_features/signup/data/model/patient_model.dart';
import 'package:dentalmatching/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class NotificationControllerImpl extends NotificationAbstractController {
  MyServices myServices = Get.find();
  NotificationData notificationData = NotificationData(Get.find());
  RequestStatus? requestStatus;
  late PatientModel patientModel =
      PatientModel.fromSharedPref(myServices.sharedPref);

  @override
  void sendNotificationToken({required String userNotificationToken}) async {
    requestStatus = RequestStatus.LOADING;
    update();
    var response = await notificationData.postData(
        token: patientModel.token,
        userName: patientModel.userName,
        notificationToken: userNotificationToken);
    print(response.toString());
    requestStatus = HandlingResponseType.fun(response);
    update();
    print("joe ;${requestStatus.toString()}");
    if (requestStatus == RequestStatus.SUCCESS) {
      if (response["success"] == true) {
        print("token sent successfully");
      }
    } else if (requestStatus == RequestStatus.UNAUTHORIZED_FAILURE) {
      print(requestStatus.toString());
    } else if (requestStatus == RequestStatus.BLOCKED_USER) {
      blockAction();
    } else {
      print("unexpected error");
    }

    update();
  }

  void initializeFirebaseAndToken() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    var token = await FirebaseMessaging.instance.getToken();
    print("Token: $token");
    // new line
    sendNotificationToken(userNotificationToken: token!);
  }
}
