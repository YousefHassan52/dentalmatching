import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProgressController extends GetxController {
  bool isExpandedAdd = false;
  List<Map<String, String>> progressEntries = [];
  List<bool> expandedStates = [];
  String progressText = '';
  late TextEditingController linkTextController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<bool> editStates = [];

  @override
  void onInit() {
    linkTextController = TextEditingController();
    super.onInit();
  }

  void toggleAdd() {
    isExpandedAdd = !isExpandedAdd;
    update();
  }

  void saveProgress(String text) {
    if (formKey.currentState!.validate()) {
      String currentDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
      progressEntries.add({'text': text, 'date': currentDate});
      expandedStates.add(false);
      editStates.add(false);
      linkTextController.clear();
      isExpandedAdd = false;
      update();
    }

  }

  void toggleAdded(int index) {
    expandedStates[index] = !expandedStates[index];
    update();
  }

  void cancelAdd() {
    linkTextController.clear();
    isExpandedAdd = false;
    update();
  }

  void editProgress(int index) {
    editStates[index] = !editStates[index];
    linkTextController.text = progressEntries[index]['text']!;
    update();
  }

  void saveEditedProgress(int index, String text) {
    if (formKey.currentState!.validate()) {
      progressEntries[index]['text'] = text;
      editStates[index] = false;
      linkTextController.clear();
      update();
    }
  }

  void cancelEdit(int index) {
    editStates[index] = false;
    linkTextController.clear();
    update();
  }
}
