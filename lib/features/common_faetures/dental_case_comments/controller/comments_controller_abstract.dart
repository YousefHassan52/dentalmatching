import 'package:get/get.dart';

abstract class CommentsControllerAbstract extends GetxController {
  void getComments({required String caseId, required String token});
  void addComment({required String caseId, required String token});
}
