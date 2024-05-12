import 'package:dentalmatching/features/common_faetures/onboarding/data/models/onboarding.dart';
import 'package:get/get.dart';

List<OnboardingModel> onboardingList = [
  OnboardingModel(
      title: "Welcome to".tr,
      small: "DentaMatch\n",
      image: "assets/svg/logoDMMM.svg",
      desc:
          "Our app saves time for both dentists and patients. Say goodbye to long waits and hello to efficient dental care.".tr),
  OnboardingModel(
      title: " Request".tr,
      image: "assets/svg/Dentistsss.svg",
      small: "Patient Cases",
      desc:
          "Grow Your Expertise with Every \nMatch - Request Patient Cases Today!".tr),
  OnboardingModel(
      title: "Quality Care,".tr,
      small: "Hassle-Free",
      image: "assets/svg/PatientBS.svg",
      desc:
          "Discover free treatment options \n affordable dental care solutions \n tailored to your needs."),
  OnboardingModel(
      title: "Join Us".tr,
      small: "To Our Journey",
      image: "assets/svg/PatientBB.svg",
      desc:
          "Together,\nLet's Create Smiles That Last a Lifetime."),
];
