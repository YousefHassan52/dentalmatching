import 'package:get/get.dart';

abstract class ViewWholeCaseDoctorControllerAbstract extends GetxController {
  Future<void> requestCase({required String caseId});
}
