import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/features/common_faetures/loginn/view/widgets/auth_button.dart';
import 'package:dentalmatching/features/doctor_features/CasesForm/View/Widgets/BioWidget.dart';
import 'package:dentalmatching/features/doctor_features/CasesForm/View/Widgets/BoxWidget.dart';
import 'package:dentalmatching/features/doctor_features/CasesForm/View/Widgets/List.dart';
import 'package:dentalmatching/features/doctor_features/CasesForm/View/Widgets/RequestButton.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/View/Widget/AppUpper.dart';
import 'package:dentalmatching/features/patient_features/AddCase/Views/Widget/FormHeadLine.dart';
import 'package:dentalmatching/features/patient_features/AddCase/Views/Widget/HDivider.dart';
import 'package:dentalmatching/features/patient_features/PatientProfile/Views/Widgets/CircleAvatarWidget.dart';
import 'package:dentalmatching/features/patient_features/view_full_case_patient/view/Widget/ChronicList.dart';
import 'package:dentalmatching/features/patient_features/view_full_case_patient/view/Widget/GridViewWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CaseForm extends StatelessWidget {
  const CaseForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const AppUpperWidget(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                        height: 80,
                        child: const CircleAvatarWidget(
                            imagePath: 'assets/svg/profile.svg'),
                      ),
                      const Text(
                        'Kamal Ahmed',
                        style: Styles.textStyle15LightBlue,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: const FittedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BioWidget(
                          title: 'Address',
                          subTitle: 'El Safa - Giza',
                        ),
                        BioWidget(
                          title: 'Age',
                          subTitle: '22',
                        ),
                        BioWidget(
                          title: 'Case Status',
                          subTitle: 'Known',
                        ),
                        BioWidget(
                          title: 'Phone umber',
                          subTitle: '01152062902',
                        ),
                        
                      ],
                    ),
                  ),
                ),
                const RequestButton(),
                const SizedBox(
                  height: 20,
                ),
                const HDivider(),
                const SizedBox(
                  height: 20,
                ),
                const FormHeadLine(headline: 'Description'),
                const SizedBox(
                  height: 20,
                ),
                const BoxWidget(
                  widget: Text(
                    'It feels like a throbbing sensation,especially when I bite down or apply pressure while chewing.',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const HDivider(),
                const SizedBox(
                  height: 20,
                ),
                const FormHeadLine(headline: 'Chronic Diseases'),
                const SizedBox(
                  height: 20,
                ),
                BoxWidget(
                  widget: ChronicList(list: [
                    'Diabetes',
                    'Hypertension',
                    'Heart Disease',
                    'Cancer',
                  ]),
                ),
                const SizedBox(
                  height: 20,
                ),
                const HDivider(),
                const SizedBox(
                  height: 20,
                ),
                const FormHeadLine(headline: 'Pictures Of Mouth'),
                const SizedBox(
                  height: 20,
                ),
                const BoxWidget(
                  widget: Text('Images'),
                ),
                const SizedBox(
                  height: 20,
                ),
                const HDivider(),
                const SizedBox(
                  height: 20,
                ),
                const FormHeadLine(headline: 'X-Ray'),
                const SizedBox(
                  height: 20,
                ),
                // const BoxWidget(
                //   widget: GridViewWidget(imagesList: imagesList),
                // ),
                const SizedBox(
                  height: 20,
                ),
                const HDivider(),
                const SizedBox(
                  height: 20,
                ),
                const FormHeadLine(headline: 'Prescription'),
                const SizedBox(
                  height: 20,
                ),
                const BoxWidget(
                  widget: Text('Images'),
                ),
          
              ],
            ),
          ),
        ],
      ),
    );
  }
}
