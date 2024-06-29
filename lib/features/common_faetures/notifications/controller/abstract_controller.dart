import 'package:get/get.dart';

abstract class NotificationAbstractController extends GetxController{
void sendNotificationToken({required String userNotificationToken});
}