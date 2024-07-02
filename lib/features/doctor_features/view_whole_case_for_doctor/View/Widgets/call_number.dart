import 'package:dentalmatching/core/functions/make_fun_call.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CallNumberWidget extends StatelessWidget {
  final String number;
  Color textColor;
  CallNumberWidget(
      {super.key, required this.number, this.textColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              children: [
                Text(
                  "${'Phone Number'.tr}: ",
                  style: TextStyle(
                      color: textColor, fontWeight: FontWeight.w300, fontSize: 20),
                ),
              ],
            ),
          ),
        ),
        Flexible(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: MaterialButton(
              onPressed: () async {
                makePhoneCall(phoneNumber: number);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(154, 158, 158, 158),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                   
                    Text(
                      number,
                      style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.w800,
                          fontSize: 18),
                    ),
                    const SizedBox(width: 5,),
                     const Icon(Icons.call,size: 18,color: Colors.white,),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
