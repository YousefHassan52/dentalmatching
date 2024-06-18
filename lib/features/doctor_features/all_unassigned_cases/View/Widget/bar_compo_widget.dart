import 'package:dentalmatching/features/doctor_features/doctor_data_viewer/doctor_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BarCompoWidget extends StatelessWidget {
  const BarCompoWidget({
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
        // row take size of the parent container = upperPartHeight
        children: [
          if (welcome == true)
            GetBuilder<DoctorDataController>(builder: (controller) {
              return Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: CircleAvatar(
                    radius: 37,
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: SizedBox.fromSize(
                          size: const Size.fromRadius(50),
                          child: controller.doctorModel.profileImageLink == null
                              ? Image.asset(
                                  "assets/images/profilepicture.png",
                                )
                              : Image.network(
                                  controller.doctorModel.profileImageLink!)),
                    ),
                  ),
                  // child: CircleAvatar(
                  //   radius: 40,
                  //   backgroundImage: AssetImage(
                  //     "assets/images/profilepicture.png",
                  //   ),
                  // ),
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
                      child: GetBuilder<DoctorDataController>(
                        builder: (internallController) => Text(
                          "Dr. ${internallController.doctorModel.fullName.split(' ')[0]}",
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
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
                                        fontSize: 25,
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
          // Spacer(),
          //  IconButton(
          //   onPressed: () {
          //     Get.back();
          //   },
          //   icon: Icon(
          //     Icons.keyboard_double_arrow_left_outlined,
          //     size: 30,
          //     color: Colors.white,
          //   ),
          // ),
        ],
      ),
    );
  }
}
