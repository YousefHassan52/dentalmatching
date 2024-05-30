import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/View/Widget/case_container.dart';
import 'package:dentalmatching/features/doctor_features/search_cases/controller/search_cases_controller_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchFormListView extends StatelessWidget {
  const SearchFormListView({super.key});

  @override
  Widget build(BuildContext context) {
    SearchCasesControllerImpl controller = Get.find();
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.8,
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 0, bottom: 60),
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: controller.cases.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CasContainer(caseModel: controller.cases[index]),
          );
        },
      ),
    );
  }
}
