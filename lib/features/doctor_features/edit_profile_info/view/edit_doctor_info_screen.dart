import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/View/Widget/app_upper.dart';
import 'package:dentalmatching/features/doctor_features/edit_profile_info/controller/edit_doctor_info_controller_impl.dart';
import 'package:dentalmatching/features/doctor_features/edit_profile_info/view/widgets/edit_patient_form_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditDoctorInfoScreen extends StatelessWidget {
  const EditDoctorInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(EditDoctorInfoControllerImp());
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
             AppUpperWidget(
              text: 'Edit Profile        '.tr,
              needBackButton: true,
              welcome: false,
            ),
            const EditDoctorFormBody(),
          ],
        ),
      ),
    );
  }
}
