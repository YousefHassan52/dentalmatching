
import 'package:connectivity_plus/connectivity_plus.dart';

class CheckInternet{

  static Future<bool> fun() async {
    ConnectivityResult result=await Connectivity().checkConnectivity();
    if(result ==ConnectivityResult.none)
      {
        return false;
      }
    else
      {
        return true;
      }
  }

}