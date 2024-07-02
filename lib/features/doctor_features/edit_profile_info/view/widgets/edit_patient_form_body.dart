// youm ma te3tal raga3 el body fe SignupScreen we 2e4ta8al 3ady
// ignore_for_file: body_might_complete_normally_nullable

import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/functions/validator.dart';
import 'package:dentalmatching/features/common_faetures/loginn/view/widgets/textformfield.dart';
import 'package:dentalmatching/features/doctor_features/edit_profile_info/controller/edit_doctor_info_controller_impl.dart';
import 'package:dentalmatching/features/doctor_features/edit_profile_info/view/widgets/gender_field_edit_patient.dart';
import 'package:dentalmatching/features/doctor_features/edit_profile_info/view/widgets/gov_dropdown_search_edit_patient.dart';
import 'package:dentalmatching/features/doctor_features/get_doctor_cases/controller/get_doctor_cases_controller_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditDoctorFormBody extends StatelessWidget {
  const EditDoctorFormBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    EditDoctorInfoControllerImp externalController = Get.find();
    GetDocotorCasesControllerImpl myCasesController = Get.find();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Form(
        key: externalController.formKey,
        child: Column(
          children: [
            AuthTextFormField(
                hint: "Full Name",
                icon: "assets/svg/first_name.svg",
                type: TextInputType.name,
                validator: (value) {
                  return AppValidator.textFormFieldValidator(
                      value!, "username");
                },
                fieldController: externalController.fullNameController),
            const SizedBox(
              height: 15,
            ),

            AuthTextFormField(
                hint: "age",
                icon: "assets/svg/age.svg",
                type: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "required";
                  }
                },
                fieldController: externalController.ageController),
            const SizedBox(
              height: 15,
            ),
            const EditDoctorGovernmentDropdownSearch(),
            const SizedBox(
              height: 15,
            ),
            const EditDoctorGenderDropdown(),
            const SizedBox(
              height: 15,
            ),
            AuthTextFormField(
                hint: "Univ",
                icon: "assets/svg/Home.svg",
                type: TextInputType.name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter your address";
                  }
                },
                fieldController: externalController.universityController),
            const SizedBox(
              height: 15,
            ),
            // phone----------------------------
            AuthTextFormField(
                hint: "Phone",
                icon: "assets/svg/phone.svg",
                type: TextInputType.phone,
                validator: (value) {
                  return AppValidator.textFormFieldValidator(value!, "phone");
                },
                fieldController: externalController.phoneController),
            const SizedBox(
              height: 15,
            ),
            // email-------------------------------
            AuthTextFormField(
                hint: "Email Address",
                icon: "assets/svg/email.svg",
                type: TextInputType.emailAddress,
                validator: (value) {
                  return AppValidator.textFormFieldValidator(value!, "email");
                },
                fieldController: externalController.emailController),
            // password----------------------------------
            // const SizedBox(
            //   height: 15,
            // ),

            const SizedBox(
              height: 30,
            ),
            // AuthButton(
            //     buttonText: "Update".tr,
            //     onTap: () {
            //       externalController.editDoctorInfo().then((value) {
            //         myCasesController.getCases();
            //       });
            //     }),

            GetBuilder<EditDoctorInfoControllerImp>(
              builder: (controller) => Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                child: controller.requestStatus == RequestStatus.LOADING
                    ? LinearProgressIndicator(
                        color: AppColors.mainColor,
                        backgroundColor: AppColors.mainColor.withOpacity(0.20),
                      )
                    : null,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: MaterialButton(
                  onPressed: () {
                    externalController.editDoctorInfo().then((value) {
                      myCasesController.getCases();
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFF4A6BAD),
                            Color.fromRGBO(25, 63, 138, 0.48),
                          ]),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xffC3C3C3),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 4), // changes position of shadow
                        ),
                      ],
                    ),
                    child: FittedBox(
                      child: Text(
                        "Update".tr,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
