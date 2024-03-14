import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/features/common_faetures/loginn/view/widgets/textformfield.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/edit_profile_info/controller/edit_doctor_info_controller_impl.dart';
import 'package:dentalmatching/features/patient_features/signup/data/static.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditDoctorGenderDropdown extends StatelessWidget {
  const EditDoctorGenderDropdown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    EditDoctorInfoControllerImp externalController = Get.find();

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
          hintText:
              externalController.userModel.gender == true ? "Male" : "Female",
          hintStyle: const TextStyle(
            color: AppColors.userTextColor,
            fontSize: 16,
          ),
        ),
      ),
      onChanged: (value) {
        externalController.gender = value;
      },
      selectedItem: externalController.gender,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Choose one";
        }
      },
    );
  }
}
