import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/View/Widget/AppUpper.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/View/Widget/CategoriesListView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePageDr extends StatelessWidget {
  const HomePageDr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppUpperWidget(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CupertinoSearchTextField(
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Categories',
              style: Styles.mediumTitle,
            ),
          ),
          
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisExtent: 100,
              crossAxisSpacing: 6,
              mainAxisSpacing: 5,
            ),
            itemCount: 5,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 100,
                    height: 90,
                    decoration: const BoxDecoration(
                      color: Color(0xff526FA6),
                      borderRadius: BorderRadius.all(Radius.circular(26)),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 55,
                          width: 45,
                          child: SvgPicture.asset('assets/svg/implant.svg'),
                        ),
                        const Flexible(
                          child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text('model',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w300)),
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
        ],
      ),
    );
  }
}
