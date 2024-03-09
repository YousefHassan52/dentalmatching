import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/features/common_faetures/loginn/view/widgets/textformfield.dart';
import 'package:dentalmatching/features/patient_features/signup/controller/signup_controller_impl.dart';
import 'package:dentalmatching/features/patient_features/signup/data/static.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenderDropdown extends StatelessWidget {
  const GenderDropdown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SignupPatientControllerImpl externalController = Get.find();

    return DropdownSearch<String>(
      popupProps: const PopupProps.menu(
        showSelectedItems: true,
      ),
      items: gender,
      dropdownDecoratorProps: const DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
            prefixIcon: CustomSvgPicture(icon: "assets/svg/gender.svg"),
            focusedBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(width: 3.0, color: AppColors.secondColor)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 3.0, color: Color(0xFFCBE1F8))),
            hintText: "Gender",
            hintStyle: TextStyle(
              color: Color.fromARGB(100, 94, 148, 195),
              fontSize: 16,
            )),
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
