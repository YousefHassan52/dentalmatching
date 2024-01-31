import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/features/common_faetures/loginn/view/widgets/textformfield.dart';
import 'package:dentalmatching/features/patient_features/signup/controller/signup_controller_impl.dart';
import 'package:dentalmatching/features/patient_features/signup/data/static.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GovernmentDropdownSearch extends StatelessWidget {
  const GovernmentDropdownSearch({
    super.key,
    required this.externalController,
  });

  final SignupControllerImpl externalController;

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      popupProps: PopupProps.menu(
        showSearchBox: true,
        showSelectedItems: true,
      ),
      items: governments,
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
            prefixIcon: const CustomSvgPicture(icon: "assets/svg/Pin.svg"),
            focusedBorder: const UnderlineInputBorder(
                borderSide:
                    BorderSide(width: 3.0, color: AppColors.secondColor)),
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(width: 3.0, color: Color(0xFFCBE1F8))),
            hintText: "Government",
            hintStyle: TextStyle(
              color: const Color.fromARGB(100, 94, 148, 195),
              fontSize: Get.width * 0.04,
            )),
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
