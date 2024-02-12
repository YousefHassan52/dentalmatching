import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/features/patient_features/AddCase/Views/Widget/FormHeadLine.dart';
import 'package:dentalmatching/features/patient_features/AddCase/Views/Widget/HDivider.dart';
import 'package:dentalmatching/features/patient_features/AddCase/Views/Widget/OptionalText.dart';
import 'package:dentalmatching/features/patient_features/View%20Form/view/Widget/ChronicList.dart';
import 'package:flutter/material.dart';
import 'package:dentalmatching/features/patient_features/PatientProfile/Views/Widgets/Upper.dart';
import 'package:dentalmatching/features/patient_features/View Form/view/Widget/GridViewWidget.dart';
import 'package:get/get.dart';

class ViewForm extends StatelessWidget {
  const ViewForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        const UpperWidget(),
        const SizedBox(
          height: 2,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: Get.width * 0.93,
            decoration: BoxDecoration(
              color: const Color.fromARGB(77, 207, 216, 220),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: const Color(0xff4A6BAD),
              ),
            ),
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const FormHeadLine(headline: 'Describe what you feel'),
                  Container(
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(62, 73, 119, 192),
                        borderRadius: BorderRadius.circular(20)),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Descriptionbsbbbbnbnbnbbmnbmnxbnbxnbmbmbm',
                          style: Styles.descripativeText),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: HDivider(),
                  ),
                  const FormHeadLine(headline: 'Chronic Diseases'),
                  ChronicList(),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: HDivider(),
                  ),
                  const FormHeadLine(headline: 'Do you know your case ?'),
                  const Text(
                    'Know',
                    style: Styles.descripativeText,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: HDivider(),
                  ),
                  const FormHeadLine(
                      headline: 'Add a Clear Pictures of your Mouth'),
                  SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: GridViewWidget(),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: HDivider(),
                  ),
                  const OptionalText(
                    text: 'Add X-Ray',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: GridViewWidget(),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: HDivider(),
                  ),
                  const OptionalText(
                    text: 'Add Prescription',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: GridViewWidget(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}

// Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const UpperWidget(),
//           const SizedBox(
//             height: 2,
//           ),
//           const FormHeadLine(headline: 'Describe what you feel'),
//           Container(
//             margin: const EdgeInsets.all(4),
//             decoration: BoxDecoration(
//                 color: AppColors.circleColor,
//                 borderRadius: BorderRadius.circular(6)),
//             child: const Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Text(
//                 'Descriptionbsbbbbnbnbnbbmnbmnxbnbxnbmbmbm',
//                 style: TextStyle(
//                   color: AppColors.greyTextColor,
//                   fontSize: 15,
//                   fontWeight: FontWeight.w500,
//                   // backgroundColor: AppColors.circleColor,
//                 ),
//               ),
//             ),
//           ),
//           const Padding(
//             padding: EdgeInsets.all(8.0),
//             child: HDivider(),
//           ),
//           const FormHeadLine(headline: 'Chronic Diseases'),
//           ChronicList(),
//           const Padding(
//             padding: EdgeInsets.all(8.0),
//             child: HDivider(),
//           ),
//           const FormHeadLine(headline: 'Do you know your case ?'),
//           const Padding(
//             padding: EdgeInsets.all(8.0),
//             child: HDivider(),
//           ),
//           const Expanded(
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 8.0),
//               child: GridViewWidget(),
//             ),
//           ),
//         ],
//       ),