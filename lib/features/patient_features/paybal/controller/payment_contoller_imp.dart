// ignore_for_file: avoid_print, no_leading_underscores_for_local_identifiers

import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/functions/handling_response_type.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/core/shared/dialogue_without_buttons.dart';
import 'package:dentalmatching/features/patient_features/paybal/controller/payment_contoller_abstract.dart';
import 'package:dentalmatching/features/patient_features/paybal/data/data.dart';

import 'package:dentalmatching/features/patient_features/signup/data/model/patient_model.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class PaybalControllerImp extends PaypalControllerAbstract {
  MyServices myServices = Get.find();
  late PatientModel patient =
      PatientModel.fromSharedPref(myServices.sharedPref);

  PaypalData paymentData = PaypalData(Get.find());
  RequestStatus? requestStatus;
  @override
  makePayment() async {
    requestStatus = RequestStatus.LOADING;
    update();
    var response = await paymentData.payment();
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
      customDialoge(title: "Warning".tr, middleText: "Unexpected error");
    } else {
      customDialoge(
          title: "Warning".tr, middleText: "Server Error Please Try Again");
    }

    update();
  }
}
