// import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/view/Widgets/EnabledInfo.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/view/Widgets/Upper.dart';
import 'package:dentalmatching/features/patient_features/View_Cases/Controller/mycases_patient_controller_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../settings_patient/view/Widgets/CounterBox.dart';
import '../../settings_patient/view/Widgets/CasesCounterWidget.dart';

class PatientProfile extends StatelessWidget {
  const PatientProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MyCasesPatientControllerImpl());
    return const Scaffold(
      body: Column(
        children: [
          UpperWidget(),
          Padding(
            padding: EdgeInsets.only(left: 20, top: 25),
            child: EnabledInfo(icon: Icons.phone_rounded, info: '01152062902'),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, top: 15),
            child: EnabledInfo(icon: Icons.mail, info: 'Hajar@gamil.com'),
          ),
          SizedBox(
            height: 25,
          ),
          CounterBox(),
          // InkWell(
          //   child: Text('Settings',style: TextStyle(color: AppColors.blueLightTextColor),),
          // )
        ],
      ),
    );
  }
}
