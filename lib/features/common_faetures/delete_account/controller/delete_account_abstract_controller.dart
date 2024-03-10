import 'package:get/get.dart';

abstract class DeleteAccountControllerAbstract extends GetxController {
  Future<void> deleteAccount({required String token});
}
