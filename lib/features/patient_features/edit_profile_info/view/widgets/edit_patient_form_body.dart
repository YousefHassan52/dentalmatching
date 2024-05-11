// youm ma te3tal raga3 el body fe SignupScreen we 2e4ta8al 3ady
import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/functions/validator.dart';
import 'package:dentalmatching/features/common_faetures/loginn/view/widgets/auth_button.dart';
import 'package:dentalmatching/features/common_faetures/loginn/view/widgets/textformfield.dart';
import 'package:dentalmatching/features/patient_features/view_cases/Controller/mycases_patient_controller_impl.dart';
import 'package:dentalmatching/features/patient_features/edit_profile_info/controller/edit_patient_info_controller_impl.dart';
import 'package:dentalmatching/features/patient_features/edit_profile_info/view/widgets/gender_field_edit_patient.dart';
import 'package:dentalmatching/features/patient_features/edit_profile_info/view/widgets/gov_dropdown_search_edit_patient.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditPatientFormBody extends StatelessWidget {
  const EditPatientFormBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    EditPatientInfoControllerImp externalController = Get.find();
    MyCasesPatientControllerImpl myCasesController = Get.find();

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
            const EditPatientGovernmentDropdownSearch(),
            const SizedBox(
              height: 15,
            ),
            const EditPatientGenderDropdown(),
            const SizedBox(
              height: 15,
            ),
            AuthTextFormField(
                hint: "Address",
                icon: "assets/svg/Home.svg",
                type: TextInputType.name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter your address";
                  }
                },
                fieldController: externalController.addressController),
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
            const SizedBox(
              height: 15,
            ),

            const SizedBox(
              height: 30,
            ),
            AuthButton(
                buttonText: "Update".tr,
                onTap: () {
                  externalController.editPatientInfo().then((value) {
                    myCasesController.getCases();
                  });
                }),
            GetBuilder<EditPatientInfoControllerImp>(
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
          ],
        ),
      ),
    );
  }
}
