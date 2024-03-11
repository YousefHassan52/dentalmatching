class ApiLinks {
  static const String signupPatient =
      "https://dentamatch.azurewebsites.net/PatientAuth/Signup";
  static const String login =
      "https://dentamatch.azurewebsites.net/Auth/SignIn";
  static const String checkEmail =
      "https://dentamatch.azurewebsites.net/Auth/forgetPassword";
  static const String verifyEmailForgetPassword =
      "https://dentamatch.azurewebsites.net/Auth/VerifyCode";
  static const String restPassword =
      "https://dentamatch.azurewebsites.net/Auth/ResetPassword";
  static const String signupDoctor =
      "https://dentamatch.azurewebsites.net/DoctorAuth/SignUp";
  static const String addCasePatient =
      "https://dentamatch.azurewebsites.net/Patient/DentalCase/AddCase";
  static const String myCasesPatient =
      "https://dentamatch.azurewebsites.net/Patient/DentalCase/GetCases";
  static const getUnassignedCasesDoctor =
      "https://dentamatch.azurewebsites.net/Doctor/DentalCase/GetUnassignedCases";
  static const String requestCase =
      "https://dentamatch.azurewebsites.net/Doctor/CaseAppointment/RequestCase?caseId=";
  static const getDoctorCases =
      "https://dentamatch.azurewebsites.net/Doctor/DentalCase/Getassignedcases";

  static const String deleteAccount =
      "https://dentamatch.azurewebsites.net/Auth/DeleteAccount";
  static const String deleteCase =
      "https://dentamatch.azurewebsites.net/Patient/DentalCase/DeleteCase?caseId=";
  static const String updatePatient =
      "https://dentamatch.azurewebsites.net/PatientAuth/UpdateAccount";
  static const String updateDoctor =
      "https://dentamatch.azurewebsites.net/DoctorAuth/UpdateAccount";
}
