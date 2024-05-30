import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/functions/validator.dart';
import 'package:dentalmatching/core/shared/shimmer_column.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/View/Widget/app_upper.dart';
import 'package:dentalmatching/features/doctor_features/search_cases/controller/search_cases_controller_impl.dart';
import 'package:dentalmatching/features/doctor_features/search_cases/view/widgets/search_button.dart';
import 'package:dentalmatching/features/doctor_features/search_cases/view/widgets/search_form_list_view.dart';
import 'package:dentalmatching/features/doctor_features/search_cases/view/widgets/searchformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SearchCasesScreen extends StatelessWidget {
  const SearchCasesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SearchCasesControllerImpl externalController =
        Get.put(SearchCasesControllerImpl());
    return Scaffold(
      body: Form(
        key: externalController.formKey,
        child: ListView(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            AppUpperWidget(
              welcome: false,
              needBackButton: true,
              text: 'Search Screen     '.tr,
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SearchTextFormField(
                        type: TextInputType.text,
                        validator: (value) {
                          return AppValidator.textFormFieldValidator(
                              value!, "username");
                        },
                        fieldController: externalController.searchController),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SearchButton(
                      buttonText: "Search".tr,
                      onTap: () {
                        externalController.getCases();
                      }),
                ),
              ],
            ),
            GetBuilder<SearchCasesControllerImpl>(builder: (controller) {
              if (controller.requestStatus == RequestStatus.SUCCESS) {
                return const SearchFormListView();
              } else if (controller.requestStatus == RequestStatus.LOADING) {
                return const ShimmerListColumn();
              } else if (controller.requestStatus ==
                  RequestStatus.EMPTY_SUCCESS) {
                return Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 350,
                        width: 270,
                        child: SvgPicture.asset('assets/svg/Empty-pana.svg'),
                      ),
                    ],
                  ),
                );
              } else {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 350,
                          width: 270,
                          child: SvgPicture.asset('assets/svg/GroupRRR.svg'),
                        ),
                      ],
                    ),
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
