import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/functions/handling_response_type.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/features/patient_features/payment/controller/payment_contoller_abstract.dart';
import 'package:dentalmatching/features/patient_features/payment/data/payment_data.dart';
import 'package:dentalmatching/features/patient_features/signup/data/model/patient_model.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentControllerImp extends PaymentControllerAbstract {
  MyServices myServices = Get.find();
  late PatientModel patient =
      PatientModel.fromSharedPref(myServices.sharedPref);

  PaymentData paymentData = PaymentData(Get.find());
  RequestStatus? requestStatus;
  @override
  makePayment() async {
    requestStatus = RequestStatus.LOADING;
    update();
    var response = await paymentData.payment(
      email: patient.email, // fsdk;jfs@fasdf
      fullName: patient.email,
      userName: patient.userName,
      phone: patient.phoneNumber,
      price: 200,
    );
    print(response.toString());
    requestStatus = HandlingResponseType.fun(response);
    update();
    print("joe ;${requestStatus.toString()}");
    if (requestStatus == RequestStatus.SUCCESS) {
      final Uri _url = Uri.parse('${response["url"]}');
      if (!await launchUrl(_url)) {
        throw Exception('Could not launch $_url');
      }
    } else if (requestStatus == RequestStatus.UNAUTHORIZED_FAILURE) {
      Get.defaultDialog(middleText: "Internet Connection Error Refresh Data ");
    } else {
      Get.defaultDialog(middleText: "Server Error Please Try Again");
    }

    update();
  }
}
