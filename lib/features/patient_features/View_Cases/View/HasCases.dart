import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/features/patient_features/PatientProfile/Views/Widgets/CircleAvatarWidget.dart';
import 'package:dentalmatching/features/patient_features/PatientProfile/Views/Widgets/Upper.dart';
import 'package:dentalmatching/features/patient_features/View_Cases/View/Widget/FormContainerInfo.dart';
import 'package:dentalmatching/features/patient_features/View_Cases/View/Widget/ImageContainer.dart';
import 'package:dentalmatching/features/patient_features/View_Cases/View/Widget/ImageContainerWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HasCases extends StatelessWidget {
  const HasCases({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const UpperWidget(),
          const SizedBox(height: 9,),
          const Padding(
            padding: EdgeInsets.only(left:8.0),
            child: Text(
              'Recently Added',
              style: Styles.textStyle16LightBlue,
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: FormContainerInfo(),
                );
              },
            ),
          ),
        ],
      ),
      // Container(
      //   child: ListView(
      //     children: [
      //       const UpperWidget(),
      //       const SizedBox(
      //         height: 15,
      //       ),

      //     ],
      //   ),
      // ),
    );
  }
}
