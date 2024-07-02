import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/features/patient_features/edit_case/controller/editCaseController.dart';
import 'package:dentalmatching/features/patient_features/view_full_case_patient/controller/view_full_case_patient_controller_impl.dart';
import 'package:dentalmatching/features/patient_features/view_full_case_patient/view/widget/grid_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AddImageEditWidget extends StatelessWidget {
  final String img;
  final String txt;
  final void Function()? onPressed;

  const AddImageEditWidget(
      {Key? key, required this.img, required this.txt, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ViewFullCasePatientControllerImpl con =
        Get.put(ViewFullCasePatientControllerImpl());
    return TextButton(
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.all(5),
        // height: Get.height * 0.4,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.circleColor,
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: const AssetImage('assets/images/G.png'),
            colorFilter: ColorFilter.mode(
              const Color.fromARGB(255, 7, 66, 162)
                  .withOpacity(0.2), // Adjust the opacity (0.0 to 1.0)
              BlendMode.dstATop,
            ),
          ),
        ),
        child: GetBuilder<EditCaseController>(
          builder: (controller) {
            return Column(
              children: [
                FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            txt,
                            style: Styles.textStyle16Grey,
                            textAlign: TextAlign.start,
                          ),
                          RichText(
                            text: TextSpan(
                              text: '*'.tr,
                              style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'select at least 2 pictures'.tr,
                                  style: Styles.textStyle16Grey,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Center(
                        child: SizedBox(
                          height: 60,
                          width: Get.width * 0.18,
                          child: SvgPicture.asset(img),
                        ),
                      ),
                    ],
                  ),
                ),
                if (controller.mouthImages == null ||
                    controller.mouthImages!.isEmpty)
                  GridViewWidget(imagesList: con.caseModel.mouthImages),
                if (controller.mouthImages != null &&
                    controller.mouthImages!.isNotEmpty)
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.mouthImages!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 3,
                                color: AppColors.mainColor,
                              ),
                              color: AppColors.mainColor,
                              borderRadius: BorderRadius.circular(26),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.file(
                                controller.mouthImages![index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
