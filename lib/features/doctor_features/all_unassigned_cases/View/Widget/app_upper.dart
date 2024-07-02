import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/view/Widget/bar_compo_widget.dart';
import 'package:dentalmatching/features/doctor_features/doctor_data_viewer/doctor_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppUpperWidget extends StatelessWidget {
  const AppUpperWidget(
      {super.key,
      this.needBackButton = false,
      this.welcome = true,
      this.text = ''});
  final bool needBackButton;
  final bool welcome;
  final String text;

  @override
  Widget build(BuildContext context) {
    const int maxLength =30 ;
    final String displayTxt =
        text.length > maxLength ? '${text.substring(0, maxLength)}...' : text;
    Get.put(DoctorDataController()); // momkn 2a7ot controller 8ero
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/images/signup.png"),
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          color: AppColors.mainColor.withOpacity(0.8),
        ),
        child: Container(
          padding: const EdgeInsets.all(0),
          //  height: upperPartHeight + 100,
          child: Center(
            child: Column(
              children: [
                if (welcome == true) const BarCompoWidget(),
                if (welcome == false)
                  if (needBackButton == true)
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 35, left: 5, bottom: 10),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                          if (welcome == false)
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  displayTxt,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  maxLines: 1,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
