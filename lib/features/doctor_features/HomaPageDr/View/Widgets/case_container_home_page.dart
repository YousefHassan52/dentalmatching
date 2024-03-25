import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/routes_names.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/data/Model/CaseDoctorModel.dart';
import 'package:dentalmatching/features/patient_features/View_Cases/View/Widget/ImageContainer.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/view/Widgets/CircleAvatarWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorHomeCaseContainer extends StatelessWidget {
  const DoctorHomeCaseContainer({
    super.key,
    required this.caseModel,
  });
  final CaseDoctorModel caseModel;

  @override
  Widget build(BuildContext context) {
    MyServices languageController = Get.find();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      //height: 320,
      width: MediaQuery.sizeOf(context).width,
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
              const SizedBox(
                height: 50,
                child: CircleAvatarWidget(imagePath: 'assets/svg/pp.svg'),
              ),
              Flexible(
                flex: 4,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    caseModel.patientName,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: AppColors.mainColor,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: IconButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.viewWholeCaseForDoctor,
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
          Flexible(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  caseModel.description,
                  style: Styles.textStyle16Grey,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
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
