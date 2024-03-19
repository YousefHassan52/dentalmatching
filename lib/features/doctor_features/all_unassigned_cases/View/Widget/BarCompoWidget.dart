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
          // if (needBackButton == true)
          //   Flexible(
          //     child: Container(
          //       margin:
          //           const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
          //       height: double.infinity,
          //       decoration: BoxDecoration(
          //         color: const Color.fromARGB(255, 255, 255, 255),
          //         borderRadius: BorderRadius.circular(10),
          //       ),
          //       child: FittedBox(
          //         fit: BoxFit.scaleDown,
          //         child: IconButton(
          //             onPressed: () {
          //               Get.back();
          //             },
          //             icon: const Icon(Icons.arrow_back)),
          //       ),
          //     ),
          //   ),
          if (welcome == true)
            Flexible(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: CircleAvatar(
                  radius: 37,
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: SizedBox.fromSize(
                        size: const Size.fromRadius(50),
                        child: Image.asset(
                          "assets/images/profilepicture.png",
                        )),
                  ),
                ),
                // child: CircleAvatar(
                //   radius: 40,
                //   backgroundImage: AssetImage(
                //     "assets/images/profilepicture.png",
                //   ),
                // ),
              ),
            ),
          const SizedBox(
            width: 10,
          ),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (welcome == true)
                  const Flexible(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "WELCOME",
                        style: TextStyle(
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
