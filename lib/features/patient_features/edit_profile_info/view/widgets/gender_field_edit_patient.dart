import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/features/common_faetures/loginn/view/widgets/textformfield.dart';
import 'package:dentalmatching/features/patient_features/edit_profile_info/controller/edit_patient_info_controller_impl.dart';
import 'package:dentalmatching/features/patient_features/signup/data/static.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditPatientGenderDropdown extends StatelessWidget {
  const EditPatientGenderDropdown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    EditPatientInfoControllerImp externalController = Get.find();

    return DropdownSearch<String>(
      popupProps: const PopupProps.menu(
        showSelectedItems: true,
      ),
      items: gender,
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          prefixIcon: const CustomSvgPicture(icon: "assets/svg/gender.svg"),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(width: 3.0, color: AppColors.secondColor)),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(width: 3.0, color: Color(0xFFCBE1F8))),
          hintText: "Gender".tr,
          hintStyle: const TextStyle(
            color: AppColors.userTextColor,
            fontSize: 16,
          ),
        ),
      ),
      onChanged: (value) {
        externalController.gender = value;
      },
      selectedItem: getGenderHint(externalController.userModel.gender),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Choose one";
        }
      },
    );
  }
}

String getGenderHint(bool gender) {
  MyServices myServices = Get.find();
  if (myServices.sharedPref.getString("lang") == "en") {
    if (gender == true) {
      return "Male";
    } else {
      return "Female";
    }
  } else {
    if (gender == true) {
      return "ذكر";
    } else {
      return "انثي";
    }
  }
}
