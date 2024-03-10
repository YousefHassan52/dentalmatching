import 'package:dentalmatching/features/patient_features/View_Cases/Controller/mycases_patient_controller_impl.dart';
import 'package:dentalmatching/features/patient_features/edit_profile_info/controller/edit_patient_info_controller_impl.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/view/Widgets/Upper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class EditPatientInfoScreen extends StatelessWidget {
  const EditPatientInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EditPatientInfoControllerImp controller =
        Get.put(EditPatientInfoControllerImp());
    MyCasesPatientControllerImpl myCasesController = Get.find();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            UpperWidget(needBackButton: true),
            IconButton(
                onPressed: () {
                  controller.editPatientInfo().then((value) {
                    myCasesController.getCases();
                  });
                },
                icon: Icon(Icons.edit))
          ],
        ),
      ),
    );
  }
}
