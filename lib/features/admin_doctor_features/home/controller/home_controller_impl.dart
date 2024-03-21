import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/constants/routes_names.dart';
import 'package:dentalmatching/core/functions/handling_response_type.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/features/admin_doctor_features/home/controller/home_controller_abstract.dart';
import 'package:dentalmatching/features/admin_doctor_features/home/data/home_data.dart';
import 'package:dentalmatching/features/admin_doctor_features/home/data/model/admin_doctor_model.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/data/Model/CaseDoctorModel.dart';
import 'package:get/get.dart';

class HomeDoctorAdminControllerImpl extends HomeDoctorAdminControllerAbstract {
  MyServices myServices = Get.find();
  late AdminDoctorModel userModel =
      AdminDoctorModel.fromSharedPref(myServices.sharedPref);
  AdminDoctorHomeData dataObject = AdminDoctorHomeData(Get.find());
  RequestStatus? requestStatus;
  List<CaseDoctorModel> cases = [];

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  @override
  getData() async {
    cases = [];
    requestStatus = RequestStatus.LOADING;
    update();
    var response = await dataObject.getUnkownCases(token: userModel.token);
    print(response.toString());
    update();
    requestStatus = HandlingResponseType.fun(response);
    print("joe ;${requestStatus.toString()}");
    if (requestStatus == RequestStatus.SUCCESS) {
      if (response["success"] == true) {
// Iterate over the response data and create MyCaseModel objects
        List<dynamic> responseData = response["data"];
        for (var data in responseData) {
          CaseDoctorModel myCase = CaseDoctorModel.fromJson(data);
          cases.add(myCase);
        }
        if (response["message"] == "No Dental Cases Available") {
          requestStatus = RequestStatus.EMPTY_SUCCESS;
          update();
        }
      }
    } else if (requestStatus == RequestStatus.UNAUTHORIZED_FAILURE) {
      Get.defaultDialog(middleText: "Internet Connection Error Refresh Data ");
    } else {
      Get.defaultDialog(middleText: "Server Error Please Try Again");
    }

    update();
  }

  @override
  void logout() {
    myServices.sharedPref.remove("token");
    myServices.sharedPref.remove("profileImage");
    myServices.sharedPref.remove("fullName");
    myServices.sharedPref.remove("email");
    myServices.sharedPref.remove("age");
    myServices.sharedPref.remove("gender");
    myServices.sharedPref.remove("city");
    myServices.sharedPref.remove("phoneNumber");
    myServices.sharedPref.remove("role");
    myServices.sharedPref.remove("userName");
    myServices.sharedPref.remove("logged");
    Get.offAllNamed(AppRoutes.login);
  }
}

/**
  void saveAdminDoctorModelToSharedPrefrence(response) {
    sharedPref.setBool("logged", true);
    sharedPref.setString("userName", response["data"]["userName"]);
    sharedPref.setString("token", response["data"]["token"]);
    sharedPref.setString(
        "profileImage", response["data"]["profileImage"] ?? '');
    sharedPref.setString("fullName", response["data"]["fullName"]);
    sharedPref.setString("email", response["data"]["email"]);
    sharedPref.setInt("age", response["data"]["age"]);
    sharedPref.setBool("gender", response["data"]["gender"]);
    sharedPref.setString("city", response["data"]["city"]);
    sharedPref.setString("phoneNumber", response["data"]["phoneNumber"]);
    sharedPref.setString("role", response["data"]["role"]);
  }
 */
