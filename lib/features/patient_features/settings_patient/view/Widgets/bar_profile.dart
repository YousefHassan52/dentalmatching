import 'package:dentalmatching/features/patient_features/patient_data_viewer/pateint_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BarProfileWidget extends StatelessWidget {
  const BarProfileWidget({
    super.key,
    this.welcome = true,
    this.needBackButton = false,
    this.text = '',
  });

  final bool welcome;
  final bool needBackButton;
  final String text;

  @override
  Widget build(BuildContext context) {
    double upperPartHeight = Get.height * 0.2;
    return Container(
      padding: const EdgeInsets.all(16),
      height: upperPartHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (welcome == true)
            GetBuilder<PatientDataController>(builder: (controller) {
              return Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: CircleAvatar(
                    radius: 37,
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: SizedBox.fromSize(
                          size: const Size.fromRadius(50),
                          child: controller.userModel.profileImageLink != null
                              ? Image.network(
                                  controller.userModel.profileImageLink!)
                              : Image.asset(
                                  "assets/images/profilepicture.png",
                                )),
                    ),
                  ),
              
                ),
              );
            }),
          const SizedBox(
            width: 10,
          ),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (welcome == true)
                  Flexible(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "WELCOME".tr,
                        style: const TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                if (welcome == true)
                  Flexible(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: GetBuilder<PatientDataController>(
                        builder: (internallController) => Text(
                          ' ${internallController.userModel.fullName.split(' ')[0]}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                Column(
               
                  children: [
                    if (welcome == false)
                      if (needBackButton == true)
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 35, left: 5, bottom: 10),
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
                                      text,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                  ],
                ),
              ],
            ),
          ),
  
        ],
      ),
    );
  }
}
