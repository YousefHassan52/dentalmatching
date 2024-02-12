import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/routes_names.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/View/Widget/AppUpper.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/View/Widget/CategoriesListView.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/View/Widget/CatigoriesWidget.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/View/Widget/DrProfileWidget.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/View/Widget/FormListView.dart';
import 'package:dentalmatching/features/patient_features/AddCase/Views/Widget/FormContainer.dart';
import 'package:dentalmatching/features/patient_features/PatientProfile/Views/Widgets/CircleAvatarWidget.dart';
import 'package:dentalmatching/features/patient_features/View_Cases/View/HasCases.dart';
import 'package:dentalmatching/features/patient_features/View_Cases/View/Widget/FormContainerInfo.dart';
import 'package:dentalmatching/features/patient_features/View_Cases/View/Widget/ImageContainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DrProfile extends StatelessWidget {
  const DrProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppUpperWidget(),
          //CategoriesListView(),
          SizedBox(
            height: 5,
          ),
          MaterialButton(
            onPressed: () {},
            child: Row(
              children: [
                Text('Search'),
                SizedBox(
                  width: 5,
                ),
                Icon(Icons.search_outlined)
              ],
            ),
          ),
          Container(
            child: FormListView(),
          ),
        ],
      ),
    );
  }
}
