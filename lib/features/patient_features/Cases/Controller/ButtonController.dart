import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/features/patient_features/Cases/Controller/KnownController.dart';
import 'package:get/get.dart';

class NextButtonController extends GetxController {
  final KnownController cont = Get.put(KnownController());
  final MyServices controller = Get.put(MyServices());

  handleButtonBehavior() {
    if (cont.selectCase == 'Unkown') {
      controller.AddedCase();
    } else if (cont.selectCase == 'Known') {
      Get.snackbar('ssd', 'message');
    } else {
      Get.snackbar('ssd', 'Choooseeee');
    }
  }
}
