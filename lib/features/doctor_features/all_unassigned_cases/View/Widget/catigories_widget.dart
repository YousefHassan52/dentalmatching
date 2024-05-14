import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/data/Model/CategoriesModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoriesWidget extends StatelessWidget {
  final CategoriesModel model;
  const CategoriesWidget({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Container(
            width: 140,
            height: 50,
            decoration: const BoxDecoration(
              color: Color(0xff526FA6),
              borderRadius: BorderRadius.all(Radius.circular(26)),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: SizedBox(
                      width: 35,
                      height: 35,
                      child: SvgPicture.asset('assets/svg/implant.svg')),
                ),
                Flexible(
                  child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(model.text,
                            style: const TextStyle(color: Colors.white)),
                      )),
                )
              ],
            ),
          ),
        ),
      ],
    );
    // Row(
    //   children: [
    //     Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 4),
    //         child: Stack(
    //           children: [
    //             Container(
    //               width: 140,
    //               height: 50,
    //               decoration: const BoxDecoration(
    //                 color: Color(0xff526FA6),
    //                 borderRadius: BorderRadius.all(Radius.circular(26)),
    //               ),
    //             ),
    //             Positioned(
    //               top: -125,
    //               left: 10,
    //               height: 300,
    //               width: 40,
    //               child: SvgPicture.asset(model.icon),
    //             ),
    //              Positioned(
    //               top: 10,
    //               left: 60,
    //               child: Text(
    //                 model.text,
    //                 style: Styles.textStyle16White,
    //               ),
    //             ),
    //           ],
    //         )
    //         //  Container(
    //         //   width: 200,
    //         //   height: 50,
    //         //   decoration: const BoxDecoration(
    //         //     color: AppColors.mainColor,
    //         //     borderRadius: BorderRadius.all(Radius.circular(26)),
    //         //   ),
    //         //   child: Row(
    //         //     children: [
    //         //       SvgPicture.asset('assets/svg/implant.svg'),

    //         //   ],),
    //         // ),
    //         ),
    //   ],
    // );
  }
}
