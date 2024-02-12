import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/View/Widget/AppUpper.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/View/Widget/FormListView.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/controller/unassigned_cases_doctor_controller_impl.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AllUnassignedCasesDoctorScreen extends StatelessWidget {
  const AllUnassignedCasesDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UnassignedCasesDoctorControllerImpl externalController =
        Get.put(UnassignedCasesDoctorControllerImpl());
    return Column(
      children: [
        const AppUpperWidget(),
        //CategoriesListView(),
        const SizedBox(
          height: 5,
        ),
        MaterialButton(
          onPressed: () {},
          child: const Row(
            children: [
              Text('Search'),
              SizedBox(
                width: 5,
              ),
              Icon(Icons.search_outlined)
            ],
          ),
        ),
        GetBuilder<UnassignedCasesDoctorControllerImpl>(builder: (controller) {
          if (controller.requestStatus == RequestStatus.SUCCESS) {
            return Container(child: const FormListView());
          } else if (controller.requestStatus == RequestStatus.LOADING) {
            return const Center(child: CircularProgressIndicator());
          } else if (controller.requestStatus == RequestStatus.EMPTY_SUCCESS) {
            return const Center(
              child: Text(
                "No Cases Yet",
                style: TextStyle(color: Colors.black),
              ),
            );
          } else {
            return const Center(
              child: Text("Reload Data"),
            );
          }
        }),
      ],
    );
  }
}
