import 'package:dentalmatching/features/patient_features/edit_profile_info/controller/edit_patient_info_controller_impl.dart';
import 'package:dentalmatching/features/patient_features/edit_profile_info/view/widgets/edit_patient_form_body.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/view/Widgets/Upper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditPatientInfoScreen extends StatelessWidget {
  const EditPatientInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(EditPatientInfoControllerImp());
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
              UpperWidget(needBackButton: true , text: 'Edit Profile        ', welcome: false,),
            EditPatientFormBody(),
          ],
        ),
      ),
    );
  }
}
/**  
 * IconButton(
                onPressed: () {
                  controller.editPatientInfo().then((value) {
                    myCasesController.getCases();
                  });
                },
                icon: const Icon(Icons.edit)), 
                */