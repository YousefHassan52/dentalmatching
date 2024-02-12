import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/routes_names.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/data/Model/CaseDoctorModel.dart';
import 'package:dentalmatching/features/patient_features/PatientProfile/Views/Widgets/CircleAvatarWidget.dart';
import 'package:dentalmatching/features/patient_features/View_Cases/View/Widget/ImageContainer.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CasContainer extends StatelessWidget {
  const CasContainer({
    Key? key,
    required this.caseModel,
  }) : super(key: key);
  final CaseDoctorModel caseModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      //height: 320,
      width: 20,
      decoration: const BoxDecoration(
        color: AppColors.circleColor,
        borderRadius: BorderRadius.all(Radius.circular(26)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                height: 70,
                child: CircleAvatarWidget(imagePath: 'assets/svg/pp.svg'),
              ),
              Text(caseModel.patientName),
              const Spacer(),
              IconButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.caseFormDoctor);
                },
                icon: const Icon(
                  Icons.double_arrow_outlined,
                  color: AppColors.mainColor,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              caseModel.description,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
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
