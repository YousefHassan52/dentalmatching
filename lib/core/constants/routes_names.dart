class AppRoutes {
  static const String initialPage = '/';

  // Auth routes
  static const String login = '/login';

  static const String signupPatinet = '/signup_patient';
  static const String signupDoctor = '/signup_doctor';

  static const String settingsPatient = '/settings_patient';
  static const String homePatient = '/home_patient';
  static const String myCasesPatient = '/mycases_patient';

  static const String settingsDoctor = '/settings_doctor';

  static const String userType = '/userType';
  static const String formView = '/formView';
  static const String viewWholeCaseForDoctor = '/caseFormDoctor';

  static const String verifyEmailCode = '/verify_email';
  //static const String home = '/home';

// forgetPassword
  static const String checkEmailForgetPassword = '/check_email_forget_password';
  static const String verifyEmailForgetPassword =
      '/verify_email_forget_password';
  static const String resetPassword = '/reset_password';

  static const String unassignedCasesDoctor = "/unassigned_cases";
  static const String homeDoctor = "/home_doctor";

  static const String editPatientInfo = "/edit_patient_info";
  static const String editDoctorInfo = "/edit_doctor_info";
  static const String editCase = "/edit_case";
  static const String fullCategories = "/fullCategories";
  static const String addCaseScreen = "/add_case";
  static const String categoryCasesScreen = "/category_cases";
  static const String searchCasesScreen = "/search_cases";
  static const String adminDoctorHome = "/admin_home";
}
