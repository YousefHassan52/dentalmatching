class ApiLinks {
  static const String signupPatient =
      "https://dentamatchbackend.smartwaveeg.com/PatientAuth/Signup";
  static const String login =
      "https://dentamatchbackend.smartwaveeg.com/Auth/SignIn";
  static const String checkEmail =
      "https://dentamatchbackend.smartwaveeg.com/Auth/forgetPassword";
  static const String verifyEmailForgetPassword =
      "https://dentamatchbackend.smartwaveeg.com/Auth/VerifyCode";
  static const String restPassword =
      "https://dentamatchbackend.smartwaveeg.com/Auth/ResetPassword";
  static const String signupDoctor =
      "https://dentamatchbackend.smartwaveeg.com/DoctorAuth/SignUp";
  static const String addCasePatient =
      "https://dentamatchbackend.smartwaveeg.com/Patient/DentalCase/AddCase";
  static const String myCasesPatient =
      "https://dentamatchbackend.smartwaveeg.com/Patient/DentalCase/GetCases";
  static const getUnassignedCasesDoctor =
      "https://dentamatchbackend.smartwaveeg.com/Doctor/DentalCase/GetUnassignedCases";
  static const String requestCase =
      "https://dentamatchbackend.smartwaveeg.com/Doctor/CaseAppointment/RequestCase?";
  static const getDoctorCases =
      "https://dentamatchbackend.smartwaveeg.com/Doctor/DentalCase/Getassignedcases";

  static const String deleteAccount =
      "https://dentamatchbackend.smartwaveeg.com/Auth/DeleteAccount";
  static const String deleteCase =
      "https://dentamatchbackend.smartwaveeg.com/Patient/DentalCase/DeleteCase?caseId=";
  static const String updatePatient =
      "https://dentamatchbackend.smartwaveeg.com/PatientAuth/UpdateAccount";
  static const String updateDoctor =
      "https://dentamatchbackend.smartwaveeg.com/DoctorAuth/UpdateAccount";
  static const String payment =
      "https://dentamatchbackend.smartwaveeg.com/Paymob/paymob";
  static const String editCase =
      "https://dentamatchbackend.smartwaveeg.com/Patient/DentalCase/UpdateCase?caseId=";
  static const String paypal =
      "https://dentamatchbackend.smartwaveeg.com/Paypal/create-payment?amount=10&description=Case";
  static const String categoryCases =
      "https://dentamatchbackend.smartwaveeg.com/Doctor/DentalCase/filterByDisease?diseasename=";

  static const String cancelCase =
      "https://dentamatchbackend.smartwaveeg.com/Doctor/CaseAppointment/CancelRequest?caseId=";
  static const String getCasesByDescription =
      "https://dentamatchbackend.smartwaveeg.com/Doctor/DentalCase/searchByDescription?query=";
  static const String getUnkownCases =
      "https://dentamatchbackend.smartwaveeg.com/DentalCase/GetUnknownCases";
  static const String classifyCase =
      "https://dentamatchbackend.smartwaveeg.com/DentalCase/ClassifyCase";
  static const String getThreeCases =
      "https://dentamatchbackend.smartwaveeg.com/Doctor/DentalCase/GetFirstThreeUnassignedCases";
  static const String getCaseComments =
      "https://dentamatchbackend.smartwaveeg.com/DentalCase/getcomment?caseId=";
  static const String addCaseComments =
      "https://dentamatchbackend.smartwaveeg.com/DentalCase/addcomment?";
  static const String reportCase =
      "https://dentamatchbackend.smartwaveeg.com/Doctor/DentalCase/report?CaseId=";
  static const String changePassword =
      "https://dentamatchbackend.smartwaveeg.com/Auth/ChangePassword";
  static const String changeProfileImg =
      "https://dentamatchbackend.smartwaveeg.com/Auth/profileimage";
}
