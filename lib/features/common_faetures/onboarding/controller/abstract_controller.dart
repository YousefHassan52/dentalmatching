import 'package:get/get.dart';

abstract class OnboardingControllerAbstract extends GetxController{
  void next();
  void onPageChanged(int index);
}