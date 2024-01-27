import 'package:dentalmatching/core/constants/routes_names.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/features/common_faetures/onboarding/controller/abstract_controller.dart';
import 'package:dentalmatching/features/common_faetures/onboarding/data/data_source/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingControllerImp extends OnboardingControllerAbstract {
  int currentPage = 0;
  PageController pageController = PageController();
  MyServices myServices = Get.find();

  // by pressing button
  @override
  void next() {
    currentPage++;
    if (currentPage > onboardingList.length - 1) {
      finishOnboarding();
      Get.offAllNamed(AppRoutes.login);
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 750), curve: Curves.easeInOut);
      update();
    }
  }

  // by scroll
  @override
  void onPageChanged(int index) {
    currentPage = index;
    update();
  }

  void finishOnboarding() {
    myServices.sharedPref.setBool("not_first", true);
  }
}
