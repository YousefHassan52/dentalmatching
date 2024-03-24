import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextTitle extends StatelessWidget {
  const TextTitle({
    super.key,
    required this.txtt,
    required this.onPressed,
  });
  final String txtt;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
     MyServices languageController = Get.find();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: FittedBox(
              child: Text(
                txtt,
                style: Styles.mediumTitle,
              ),
            ),
          ),
          const Spacer(),
          Flexible(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: MaterialButton(
                onPressed: onPressed,
                child: Row(
                  children: [
                    RichText(
                        text:  TextSpan(children: [
                      TextSpan(
                          text: 'See All'.tr,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color(0xFF0F2F6C),
                          ))
                    ])),
                    const SizedBox(
                      width: 5,
                    ),
                    languageController.sharedPref.getString("lang") == "en"
                            ? const Icon(
                                Icons.keyboard_double_arrow_right_outlined,
                                color: Color(0xFF0F2F6C),
                              )
                            : const Icon(
                                Icons.keyboard_double_arrow_left_outlined,
                                color: Color(0xFF0F2F6C),
                              ),
                    // const Icon(
                    //   Icons.double_arrow_outlined,
                    //   size: 18,
                    //   color: Color(0xFF0F2F6C),
                    // ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
