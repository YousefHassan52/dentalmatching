import 'dart:ffi';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPref;

  RxInt casesCounter = 0.obs ;

  Future<MyServices> init() async {
    sharedPref = await SharedPreferences.getInstance();
    casesCounter.value =  sharedPref.getInt('casesCounter') ?? 0 ;  
    return this;
  }

  AddedCase()
{
  casesCounter.value++;
  sharedPref.setInt("casesCounter", casesCounter.value);
}

  Resest()
{
  casesCounter.value = 0 ;
  sharedPref.setInt("casesCounter", casesCounter.value);
}

}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
}

