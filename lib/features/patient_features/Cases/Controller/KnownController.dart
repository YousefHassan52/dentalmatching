import 'package:get/get.dart';

class KnownController extends GetxController {
  RxList<bool> checkedItems = List.generate(1, (index) => false).obs;
  RxString selectCase = ''.obs;
  final List<String> choise = [
    'Known',
    'Unkown',
  ];

   void handleSelectionChange(String value) {
    selectCase.value = value;
    update();
  }


}
