import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/features/common_faetures/onboarding/data/data_source/static.dart';
import 'package:dentalmatching/features/common_faetures/onboarding/data/models/onboarding.dart';
import 'package:dentalmatching/features/common_faetures/onboarding/view/widgets/animatedsvg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomOnboardingItem extends StatelessWidget {
  const CustomOnboardingItem(
      {Key? key, required this.item, required this.index})
      : super(key: key);
  final OnboardingModel item;
  final int index;
  @override
  Widget build(BuildContext context) {
    MyServices languageController = Get.find();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Usage
          Expanded(
            flex: 4,
            child: BreathingAnimatedSvg(
              imagePath: item.image,
              height: Get.height * 0.4,
            ),
          ),
          Expanded(
            flex: 2,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                "${item.title} ${item.small}",
                style: Styles.extraLargetitle,
              ),
            ),
          ),
          // if (languageController.sharedPref.getString("lang") == "en")
          //   Expanded(
          //     flex: 2,
          //     child: FittedBox(
          //       child: Text(item.small!,
          //           style: const TextStyle(
          //               color: AppColors.mainColor,
          //               fontWeight: FontWeight.w700,
          //               fontSize: 42,
          //               letterSpacing: 4)),
          //     ),
          //   ),
          // if (languageController.sharedPref.getString("lang") == "ar")
          //   Expanded(
          //     flex: 2,
          //     child: FittedBox(
          //       fit: BoxFit.scaleDown,
          //       child: Text(item.small!,
          //           style: const TextStyle(
          //             color: AppColors.mainColor,
          //             fontWeight: FontWeight.w700,
          //             fontSize: 42,
          //           )),
          //     ),
          //   ),
          if (index != onboardingList.length - 1)
            Expanded(
              flex: 4,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: Text(
                    item.desc,
                    textAlign: TextAlign.center,
                    style: Styles.textStyle16,
                  ),
                ),
              ),
            ),
          if (index == onboardingList.length - 1)
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.only(top: 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        item.desc.split('\n')[0], // Text before \n
                        textAlign: TextAlign.center,
                        style: Styles.textStyle16,
                      ),
                      TextButton(
                        onPressed: () async {
                          final Uri _url = Uri.parse(
                              'https://www.termsfeed.com/live/65015831-442b-4911-9eb3-3e2707da1eab');
                          if (!await launchUrl(_url)) {
                            throw Exception('Could not launch $_url');
                          }
                        },
                        child: Text(
                          item.desc.split('\n')[1], // Text after \n
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: AppColors.blueLightTextColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                              decoration: TextDecoration
                                  .underline), // Apply different text style here
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          // if (index == onboardingList.length - 1)
          //   Expanded(
          //       flex: 1,
          //       child: TextButton(
          //         child: const Text("button"),
          //         onPressed: () {},
          //       ))
        ],
      ),
    );
  }
}
