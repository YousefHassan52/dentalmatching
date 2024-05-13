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
      "https://dentamatch.azurewebsites.net/Doctor/CaseAppointment/RequestCase?";
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
  static const String payment =
      "https://dentamatch.azurewebsites.net/Paymob/paymob";
  static const String editCase =
      "https://dentamatch.azurewebsites.net/Patient/DentalCase/UpdateCase?caseId=";
  static const String paypal =
      "https://dentamatch.azurewebsites.net/Paypal/create-payment?amount=10&description=Case";
  static const String categoryCases =
      "https://dentamatch.azurewebsites.net/Doctor/DentalCase/filterByDisease?diseasename=";

  static const String cancelCase =
      "https://dentamatch.azurewebsites.net/Doctor/CaseAppointment/CancelRequest?caseId=";
  static const String getCasesByDescription =
      "https://dentamatch.azurewebsites.net/Doctor/DentalCase/searchByDescription?query=";
  static const String getUnkownCases =
      "https://dentamatch.azurewebsites.net/DentalCase/GetUnknownCases";
  static const String classifyCase =
      "https://dentamatch.azurewebsites.net/DentalCase/ClassifyCase";
  static const String getThreeCases =
      "https://dentamatch.azurewebsites.net/Doctor/DentalCase/GetFirstThreeUnassignedCases";
  static const String getCaseComments =
      "https://dentamatch.azurewebsites.net/DentalCase/getcomment?caseId=";
  static const String addCaseComments =
      "https://dentamatch.azurewebsites.net/DentalCase/addcomment?";
  static const String reportCase =
      "https://dentamatch.azurewebsites.net/Doctor/DentalCase/report?CaseId=";
  static const String changePassword =
      "https://dentamatch.azurewebsites.net/Auth/ChangePassword";
}
