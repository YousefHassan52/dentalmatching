// ignore_for_file: body_might_complete_normally_nullable

import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/functions/chosen_gov.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/features/common_faetures/loginn/view/widgets/textformfield.dart';
import 'package:dentalmatching/features/patient_features/signup/controller/signup_controller_impl.dart';
import 'package:dentalmatching/features/patient_features/signup/data/static.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GovernmentDropdownSearch extends StatelessWidget {
  const GovernmentDropdownSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SignupPatientControllerImpl externalController = Get.find();
    MyServices myServices = Get.find();

    return DropdownSearch<String>(
      popupProps: const PopupProps.menu(
        showSearchBox: true,
        showSelectedItems: true,
      ),
      items: myServices.sharedPref.getString("lang") == "en"
          ? governments
          : arabicGovernments,
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
            prefixIcon: const CustomSvgPicture(icon: "assets/svg/Pin.svg"),
            focusedBorder: const UnderlineInputBorder(
                borderSide:
                    BorderSide(width: 3.0, color: AppColors.secondColor)),
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(width: 3.0, color: Color(0xFFCBE1F8))),
            hintText: "Governorate".tr,
            hintStyle: const TextStyle(
              color: Color.fromARGB(100, 94, 148, 195),
              fontSize: 16,
            )),
      ),
      onChanged: (value) {
        if (myServices.sharedPref.getString("lang") == "en") {
          externalController.gov = value;
        } else {
          externalController.gov = chosenGov(value!);
        }
      },
      selectedItem: externalController.gov,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Choose one";
        }
      },
    );
  }
}
