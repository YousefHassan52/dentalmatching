// ignore_for_file: file_names

import 'package:dentalmatching/core/class/crud.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(CRUD());
  }
}
