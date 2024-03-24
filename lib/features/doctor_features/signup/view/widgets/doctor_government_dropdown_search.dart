import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/features/common_faetures/loginn/view/widgets/textformfield.dart';
import 'package:dentalmatching/features/doctor_features/signup/controller/signup_doctor_controller_impl.dart';
import 'package:dentalmatching/features/patient_features/signup/data/static.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DocotrGovernmentDropdownSearch extends StatelessWidget {
  const DocotrGovernmentDropdownSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SignupDoctorControllerImpl externalController = Get.find();

    return DropdownSearch<String>(
      popupProps: const PopupProps.menu(
        showSearchBox: true,
        showSelectedItems: true,
      ),
      items: governments,
      dropdownDecoratorProps: const DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
            prefixIcon: CustomSvgPicture(icon: "assets/svg/Pin.svg"),
            focusedBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(width: 3.0, color: AppColors.secondColor)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 3.0, color: Color(0xFFCBE1F8))),
            hintText: "Governorate",
            hintStyle: TextStyle(
              color: Color.fromARGB(100, 94, 148, 195),
              fontSize: 14,
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
