import 'package:dentalmatching/core/constants/routes_names.dart';
import 'package:dentalmatching/core/middlewares/first_screen.dart';
import 'package:dentalmatching/features/common_faetures/Pre%20SignUp/PreSignUpPage.dart';
import 'package:dentalmatching/features/common_faetures/forget_password/check_email/view/check_email_for_forget.dart';
import 'package:dentalmatching/features/common_faetures/forget_password/reset_password/view/reset_password_screen.dart';
import 'package:dentalmatching/features/common_faetures/forget_password/verify_email_code_for_forget/view/verify_forget_password_code_screen.dart';
import 'package:dentalmatching/features/common_faetures/loginn/view/login.dart';
import 'package:dentalmatching/features/common_faetures/onboarding/view/screens/onboarding.dart';
import 'package:get/get.dart';

List<GetPage> routes = [
  GetPage(
      name: '/',
      page: () => const OnboardingScreen(),
      middlewares: [FirstScreen()]),
  // GetPage(name: '/', page:()=>const TestScreen()),
  GetPage(name: AppRoutes.login, page: () => const LoginScreen()),
  // GetPage(name: AppRoutes.signup, page: () => const SignupScreen()),

  // forget password
  GetPage(
      name: AppRoutes.checkEmailForgetPassword,
      page: () => const CheckEmailForForgetPasswordScreen()),
  GetPage(
      name: AppRoutes.verifyEmailForgetPassword,
      page: () => const VerifyForgetPasswordCodeScreen()),
  GetPage(
      name: AppRoutes.resetPassword, page: () => const ResetPasswordScreen()),
 
  GetPage(
      name: AppRoutes.userType, page: () => const PreSignup()),

  // GetPage(
  //     name: AppRoutes.verifyEmailCode,
  //     page: () => const VerifyEmailCodeScreen()),

  // GetPage(name: AppRoutes.home, page: () => const HomeScreen()),

  // GetPage(name: AppRoutes.settings, page: () => const SettingsScreen()),
];
