// ignore: file_names
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/features/patient_features/AddCase/Controller/FormController.dart';
import 'package:dentalmatching/features/patient_features/patient_data_viewer/pateint_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpperWidget extends StatelessWidget {
  const UpperWidget({super.key, this.needBackButton = false});
  final bool needBackButton;

  @override
  Widget build(BuildContext context) {
    PatientDataController controller = Get.put(PatientDataController());
    // momken te7tag hena controller mo5tlef
    double upperPartHeight = Get.height * 0.2;
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
          padding: const EdgeInsets.all(16),
          height: upperPartHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            // row take size of the parent container = upperPartHeight
            children: [
              if (needBackButton == true)
                Flexible(
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(Icons.arrow_back)),
                    ),
                  ),
                ),

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
                    Flexible(
                      child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: GetBuilder<PatientDataController>(
                            builder: (internallController) => Text(
                              internallController.userModel.fullName
                                  .split(' ')[0],
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          )),
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
        ),
      ),
    );
  }
}
