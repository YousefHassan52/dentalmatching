// ignore_for_file: file_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/routes_names.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/features/patient_features/patient_data_viewer/pateint_data_controller.dart';
import 'package:dentalmatching/features/patient_features/view_casess/data/Model/case_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../settings_patient/view/Widgets/circle_avatar_widget.dart';
import 'image_container.dart';

class FormContainerInfo extends StatelessWidget {
  const FormContainerInfo({Key? key, required this.caseModel})
      : super(key: key);

  final PatientCaseModel caseModel;

  @override
  Widget build(BuildContext context) {
    MyServices languageController = Get.find();
    PatientDataController patientData = Get.put(PatientDataController());
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      //height: 320,
      width: 20,
      decoration: BoxDecoration(
        //color: AppColors.circleColor,
        borderRadius: const BorderRadius.all(Radius.circular(26)),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: const AssetImage('assets/images/oo.png'),
          colorFilter: ColorFilter.mode(
            const Color.fromARGB(255, 7, 66, 162)
                .withOpacity(0.2), // Adjust the opacity (0.0 to 1.0)
            BlendMode.dstATop,
          ),
        ),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 50,
                child: patientData.userModel.profileImageLink == null
                    ? const CircleAvatarWidget(imagePath: 'assets/svg/pp.svg')
                    : CircleAvatarWidget(
                        imagePath: patientData.userModel.profileImageLink!,
                        defaultImage: false,
                      ),
              ),
              Flexible(
                flex: 4,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    caseModel.patientName,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: AppColors.mainColor,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              if (caseModel.isAssigned == true)
                const Icon(
                  Icons.check_circle_rounded,
                  color: Colors.green,
                ),
              const Spacer(),
              Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: IconButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.formView,
                          arguments: {"case": caseModel});
                    },
                    icon:
                        languageController.sharedPref.getString("lang") == "en"
                            ? const Icon(
                                Icons.keyboard_double_arrow_right_outlined,
                                color: AppColors.mainColor,
                              )
                            : const Icon(
                                Icons.keyboard_double_arrow_left_outlined,
                                color: AppColors.mainColor,
                              ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AutoSizeText(
              caseModel.description,
              style: Styles.textStyle16Grey,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            height: 130,
            child: ImageContainer(imagesList: caseModel.mouthImages),
          )
        ],
      ),
    );
  }
}
