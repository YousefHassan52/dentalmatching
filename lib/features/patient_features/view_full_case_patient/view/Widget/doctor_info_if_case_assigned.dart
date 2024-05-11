import 'package:dentalmatching/features/doctor_features/view_whole_case_for_doctor/View/Widgets/BioWidget.dart';
import 'package:dentalmatching/features/patient_features/add_case/Views/Widget/FormHeadLine.dart';
import 'package:dentalmatching/features/patient_features/add_case/Views/Widget/HDivider.dart';
import 'package:dentalmatching/features/patient_features/view_cases/data/Model/case_model.dart';
import 'package:flutter/material.dart';

class DoctorInfoIfCaseAssigned extends StatelessWidget {
  const DoctorInfoIfCaseAssigned({
    super.key,
    required this.caseModel,
  });

  final PatientCaseModel caseModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        const Row(
          children: [
            FormHeadLine(headline: 'Your Case Assigned:'),
            Spacer(),
            Icon(
              Icons.check_circle,
              color: Colors.green,
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.all(20),
          child: FittedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BioWidget(
                  title: 'Dr Name: ',
                  subTitle: caseModel.doctorName!,
                ),
                BioWidget(
                  title: 'University: ',
                  subTitle: caseModel.doctorUniversity!,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: HDivider(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
