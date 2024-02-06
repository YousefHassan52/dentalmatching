import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/features/patient_features/Cases/Controller/FormController.dart';
import 'package:get/get.dart';

class NextButtonController extends GetxController {
  final ChronicDiseasesController cont = Get.put(ChronicDiseasesController());
  final MyServices controller = Get.put(MyServices());

  handleButtonBehavior() {
    if (cont.selected == 'Unkown') {
      controller.AddedCase();
    } else if (cont.selected == 'Known') {
      Get.snackbar('ssd', 'message');
    } else {
      Get.snackbar('ssd', 'Choooseeee');
    }
  }
}
