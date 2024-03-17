import 'package:dentalmatching/core/constants/routes_names.dart';
import 'package:dentalmatching/core/middlewares/first_screen.dart';
import 'package:dentalmatching/features/common_faetures/Pre%20SignUp/PreSignUpPage.dart';
import 'package:dentalmatching/features/common_faetures/forget_password/check_email/view/check_email_for_forget.dart';
import 'package:dentalmatching/features/common_faetures/forget_password/reset_password/view/reset_password_screen.dart';
import 'package:dentalmatching/features/common_faetures/forget_password/verify_email_code_for_forget/view/verify_forget_password_code_screen.dart';
import 'package:dentalmatching/features/common_faetures/loginn/view/login.dart';
import 'package:dentalmatching/features/common_faetures/onboarding/view/screens/onboarding.dart';
import 'package:dentalmatching/features/doctor_features/Full%20Categories%20Page/View/FullCategory.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/edit_profile_info/view/edit_doctor_info_screen.dart';
import 'package:dentalmatching/features/doctor_features/settings_doctor/view/profile_doctor_screen.dart';
import 'package:dentalmatching/features/doctor_features/view_whole_case_for_doctor/View/view_whole_case_doctor_screen.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/View/all_unassigned_cases_doctor_screen.dart';
import 'package:dentalmatching/features/doctor_features/home/home_doctor.dart';
import 'package:dentalmatching/features/doctor_features/signup/view/signup_screen.dart';
import 'package:dentalmatching/features/patient_features/edit_case/view/edit_screen.dart';
import 'package:dentalmatching/features/patient_features/edit_profile_info/view/edit_patient_info_screen.dart';
import 'package:dentalmatching/features/patient_features/view_full_case_patient/view/ViewForm.dart';
import 'package:dentalmatching/features/patient_features/View_Cases/View/HasCases.dart';
import 'package:dentalmatching/features/patient_features/home/view/home_screen.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/view/profile_patient_screen.dart';
import 'package:dentalmatching/features/patient_features/signup/view/signup_screen.dart';
import 'package:get/get.dart';

List<GetPage> routes = [
  GetPage(
      name: '/',
      page: () => const OnboardingScreen(),
      middlewares: [FirstScreen()]),
  // GetPage(name: '/', page:()=>const TestScreen()),
  GetPage(name: AppRoutes.login, page: () => const LoginScreen()),
  GetPage(
      name: AppRoutes.signupPatinet, page: () => const SignupPatientScreen()),
  GetPage(name: AppRoutes.signupDoctor, page: () => const SignupDoctorScreen()),

  GetPage(
    name: AppRoutes.settingsPatient,
    page: () => const SettingsPatientScreen(),
  ),

  GetPage(
      name: AppRoutes.settingsDoctor, page: () => const SettingsDoctorScreen()),
  GetPage(
      name: AppRoutes.unassignedCasesDoctor,
      page: () => const AllUnassignedCasesDoctorScreen()),
  GetPage(
      name: AppRoutes.viewWholeCaseForDoctor,
      page: () => const ViewWholeCaseForDoctor()),
  GetPage(name: AppRoutes.homeDoctor, page: () => const HomeDoctorScreen()),

  GetPage(name: AppRoutes.homePatient, page: () => const HomePatientScreen()),
  GetPage(name: AppRoutes.myCasesPatient, page: () => const HasCases()),
  GetPage(name: AppRoutes.formView, page: () => const ViewForm()),

  // forget password
  GetPage(
      name: AppRoutes.checkEmailForgetPassword,
      page: () => const CheckEmailForForgetPasswordScreen()),
  GetPage(
      name: AppRoutes.verifyEmailForgetPassword,
      page: () => const VerifyForgetPasswordCodeScreen()),
  GetPage(
      name: AppRoutes.resetPassword, page: () => const ResetPasswordScreen()),

  GetPage(name: AppRoutes.userType, page: () => const PreSignup()),
  GetPage(
      name: AppRoutes.editPatientInfo,
      page: () => const EditPatientInfoScreen()),
  GetPage(
      name: AppRoutes.editDoctorInfo, page: () => const EditDoctorInfoScreen()),
  GetPage(name: AppRoutes.editCase, page: () => const EditCaseScreen()),
  GetPage(name: AppRoutes.fullCategories, page: () => const FullCategories()),

  // GetPage(
  //     name: AppRoutes.verifyEmailCode,
  //     page: () => const VerifyEmailCodeScreen()),

  // GetPage(name: AppRoutes.home, page: () => const HomeScreen()),

  // GetPage(name: AppRoutes.settings, page: () => const SettingsScreen()),
];
