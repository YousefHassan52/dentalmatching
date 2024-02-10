// import 'package:dentalmatching/core/constants/styles.dart';
// import 'package:dentalmatching/features/patient_features/PatientProfile/Views/Widgets/Upper.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class NoCases extends StatelessWidget {
//   const NoCases({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: [
//           const UpperWidget(),
//           SizedBox(
//             height: 350,
//             child: SvgPicture.asset('assets/svg/NoCases.svg'),
//           ),
//           const Column(
//             children: [
//               Text(
//                 'There are No Cases',
//                 style: Styles.mediumTitle,
//               ),
//               Text(
//                 'Add your case now.',
//                 style: Styles.greySpacer,

//               ),
//               Text(
//                 'More than one doctor',
//                 style: Styles.greySpacer,

//               ),
//               Text(
//                 'will communicate with you',
//                 style: Styles.greySpacer,

//               ),
//             ],
//           ),
//           // Center(
//           //   child: RichText(
//           //     text: const TextSpan(
//           //       text: 'There are No Cases',
//           //       style: Styles.mediumTitle,
//           //       children: [
//           //         TextSpan(
//           //           text: '\n Add your case now.',
//           //           style: Styles.greySpacer,
//           //         ),
//           //         TextSpan(
//           //           text: '\n More than one doctor',
//           //           style: Styles.greySpacer,
//           //         ),
//           //         TextSpan(
//           //           text: '\n will communicate with you',
//           //           style: Styles.greySpacer,
//           //         ),
//           //       ],
//           //     ),
//           //   ),
//           // )
//         ],
//       ),
//     );
//   }
// }

import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/features/common_faetures/loginn/view/widgets/auth_button.dart';
import 'package:dentalmatching/features/patient_features/PatientProfile/Views/Widgets/Upper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class NoCases extends StatelessWidget {
  const NoCases({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const UpperWidget(),
            SizedBox(
              height: 400,
              child: SvgPicture.asset('assets/svg/NoCases.svg'),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      'There are No Cases',
                      style: Styles.mediumTitle,
                    ),
                  ),
                  SizedBox(height: 8),
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      'Add your case now.',
                      style: Styles.greySpacer,
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      'More than one doctor',
                      style: Styles.greySpacer,
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      'Will communicate with you',
                      style: Styles.greySpacer,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: AuthButton(buttonText: 'Add Case', onTap: () {}),
            )
          ],
        ),
      ),
    );
  }
}
