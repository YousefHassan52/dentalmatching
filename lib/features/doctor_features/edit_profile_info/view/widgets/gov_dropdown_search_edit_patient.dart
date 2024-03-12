import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/features/common_faetures/loginn/view/widgets/textformfield.dart';
import 'package:dentalmatching/features/doctor_features/edit_profile_info/controller/edit_doctor_info_controller_impl.dart';
import 'package:dentalmatching/features/patient_features/signup/data/static.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditDoctorGovernmentDropdownSearch extends StatelessWidget {
  const EditDoctorGovernmentDropdownSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    EditDoctorInfoControllerImp externalController = Get.find();

    return DropdownSearch<String>(
      popupProps: const PopupProps.menu(
        showSearchBox: true,
        showSelectedItems: true,
      ),
      items: governments,
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          prefixIcon: const CustomSvgPicture(icon: "assets/svg/Pin.svg"),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(width: 3.0, color: AppColors.secondColor)),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(width: 3.0, color: Color(0xFFCBE1F8))),
          hintText: externalController.userModel.city,
          hintStyle: const TextStyle(
            color: AppColors.userTextColor,
            fontSize: 16,
          ),
        ),
      ),
      onChanged: (value) {
        externalController.gov = value;
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
