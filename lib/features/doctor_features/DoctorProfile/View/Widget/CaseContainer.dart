
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/routes_names.dart';
import 'package:dentalmatching/features/patient_features/PatientProfile/Views/Widgets/CircleAvatarWidget.dart';
import 'package:dentalmatching/features/patient_features/View_Cases/Data/Model/case_model.dart';
import 'package:dentalmatching/features/patient_features/View_Cases/View/Widget/ImageContainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CasContainer extends StatelessWidget {
  const CasContainer({Key? key, })
      : super(key: key);



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
                child:
                    CircleAvatarWidget(imagePath: 'assets/svg/pp.svg'),
              ),
              const Text('Hajar'),
               SizedBox(
                width: Get.width * 0.355,
              ),
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
            
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'It feels like a throbbing sensation,especially when I bite down or apply pressure while chewing.',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            height: 130,
            child: ImageContainer(),
          )
        ],
      ),
    );
  }}