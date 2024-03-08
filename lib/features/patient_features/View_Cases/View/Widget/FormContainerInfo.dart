import 'package:auto_size_text/auto_size_text.dart';
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/routes_names.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/view/Widgets/CircleAvatarWidget.dart';

import 'package:dentalmatching/features/patient_features/View_Cases/View/Widget/ImageContainer.dart';
import 'package:dentalmatching/features/patient_features/View_Cases/data/Model/case_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormContainerInfo extends StatelessWidget {
  const FormContainerInfo({Key? key, required this.caseModel})
      : super(key: key);

  final MyCaseModel caseModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      //height: 320,
      width: 20,
      decoration: BoxDecoration(
        //color: AppColors.circleColor,
        borderRadius: BorderRadius.all(Radius.circular(26)),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/oo.png'),
          colorFilter: ColorFilter.mode(
            Color.fromARGB(255, 7, 66, 162)
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // const SizedBox(
              //   height: 50,
              //   child: CircleAvatarWidget(imagePath: 'assets/svg/pp.svg'),
              // ),
              Container(
                width: 150,
                alignment: Alignment.centerLeft,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: RichText(
                    text: TextSpan(
                      text: caseModel.patientName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.mainColor,
                      ),
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
              IconButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.formView,
                      arguments: {"case": caseModel});
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
            child: AutoSizeText(
              caseModel.description,
              style: Styles.textStyle16Grey,
              //  const TextStyle(
              //   fontSize: 20,
              //   fontWeight: FontWeight.w400,
              // ),
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
