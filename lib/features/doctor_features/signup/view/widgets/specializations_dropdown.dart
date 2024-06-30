import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/features/common_faetures/loginn/view/widgets/textformfield.dart';
import 'package:dentalmatching/features/doctor_features/signup/controller/signup_doctor_controller_impl.dart';
import 'package:dentalmatching/features/doctor_features/signup/data/models/static.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DocotrSpecializationDropdownSearch extends StatelessWidget {
  const DocotrSpecializationDropdownSearch({
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
      items: specializations,
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
            prefixIcon:
                const CustomSvgPicture(icon: "assets/svg/specialization.svg"),
            focusedBorder: const UnderlineInputBorder(
                borderSide:
                    BorderSide(width: 3.0, color: AppColors.secondColor)),
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(width: 3.0, color: Color(0xFFCBE1F8))),
            hintText: "Specialization".tr,
            hintStyle: const TextStyle(
              color: Color.fromARGB(100, 94, 148, 195),
              fontSize: 14,
            )),
      ),
      onChanged: (value) {
        externalController.specialization = value;
      },
      selectedItem: externalController.specialization,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Choose one";
        }
      },
    );
  }
}
