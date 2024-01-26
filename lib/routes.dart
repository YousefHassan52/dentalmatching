import 'package:dentalmatching/core/constants/routes_names.dart';
import 'package:dentalmatching/core/middlewares/first_screen.dart';
import 'package:dentalmatching/features/common_faetures/login/view/login.dart';
import 'package:dentalmatching/features/common_faetures/onboarding/view/screens/onboarding.dart';
import 'package:get/get.dart';

List<GetPage> routes = [
  GetPage(
      name: '/',
      page: () => const OnboardingScreen(),
      middlewares: [FirstScreen()]),
  // GetPage(name: '/', page:()=>const TestScreen()),
  GetPage(name: AppRoutes.login, page: () => const LoginScreen()),
  /*GetPage(name: AppRoutes.signup, page: () => const SignupScreen()),
  GetPage(
      name: AppRoutes.checkEmailForgetPassword,
      page: () => const ForgetPasswordScreen()),
  GetPage(
      name: AppRoutes.verifyEmailForgetPassword,
      page: () => const VerifyForgetPasswordCodeScreen()),
  GetPage(
      name: AppRoutes.verifyEmailCode,
      page: () => const VerifyEmailCodeScreen()),
  GetPage(
      name: AppRoutes.resetPassword, page: () => const ResetPasswordScreen()),
  GetPage(name: AppRoutes.home, page: () => const HomeScreen()),

  GetPage(name: AppRoutes.settings, page: () => const SettingsScreen()),

*/
];
