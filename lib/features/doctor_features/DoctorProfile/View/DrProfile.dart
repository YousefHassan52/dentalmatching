import 'package:dentalmatching/features/doctor_features/DoctorProfile/View/Widget/AppUpper.dart';
import 'package:dentalmatching/features/doctor_features/DoctorProfile/View/Widget/CategoriesListView.dart';
import 'package:dentalmatching/features/doctor_features/DoctorProfile/View/Widget/CatigoriesWidget.dart';
import 'package:dentalmatching/features/doctor_features/DoctorProfile/View/Widget/DrProfileWidget.dart';
import 'package:flutter/material.dart';

class DrProfile extends StatelessWidget {
  const DrProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AppUpperWidget(),
          CategoriesListView(),
          
        ],
      ),
    );
  }
}
