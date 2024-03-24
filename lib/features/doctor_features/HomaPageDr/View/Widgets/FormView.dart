import 'package:dentalmatching/core/constants/routes_names.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/features/doctor_features/HomaPageDr/View/Widgets/Categories.dart';
import 'package:dentalmatching/features/doctor_features/HomaPageDr/View/Widgets/TextTitle.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/View/Widget/AppUpper.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/View/Widget/CaseContainer.dart';
import 'package:dentalmatching/features/doctor_features/all_unassigned_cases/controller/unassigned_cases_doctor_controller_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormView extends StatelessWidget {
  const FormView({super.key});

  @override
  Widget build(BuildContext context) {
    UnassignedCasesDoctorControllerImpl controller = Get.find();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppUpperWidget(),
          const SizedBox(
            height: 10,
          ),
          IconButton(
            onPressed: () {
              Get.toNamed(AppRoutes.searchCasesScreen);
            },
            icon: Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(94, 183, 181, 181)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      "Search".tr,
                      style: Styles.textStyle16.copyWith(
                          color: Colors.grey, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const Flexible(
                    child: Icon(
                      Icons.search_rounded,
                      color: Colors.grey,
                      size: 32,
                    ),
                  ),
                ],
              ),
            ),
          ),
          TextTitle(
            txtt: 'Categories'.tr,
            onPressed: () {
              Get.toNamed(AppRoutes.fullCategories);
            },
          ),
          const CategoriesBuilder(
            images: [
              'assets/svg/implant.svg',
              'assets/svg/implant.svg',
              'assets/svg/implant.svg',
              'assets/svg/implant.svg',
              'assets/svg/implant.svg',
              'assets/svg/implant.svg',
              'assets/svg/implant.svg',
            ],
            txt: [
              'Gumboil',
              'Gingivitis',
              'Edentulous',
              'Displaced tooth',
              'Dental abscess',
              'Orthodontics',
              'Caries',
              'Endodontics',
              'Prosthodontic',
              'Implantology',
              'General',
            ],
            itemCount: 6,
            color: [
              Color(0xff526FA6),
              Color(0xFF103579),
              Color(0xff526FA6),
              Color(0xFF103579),
              Color(0xff526FA6),
              Color(0xFF103579),
              Color(0xff526FA6),
              Color(0xFF103579),
              Color(0xff526FA6),
              Color(0xFF103579),
              Color(0xff526FA6),
            ],
          ),
          // TextTitle(
          //   txtt: 'Appointments',
          //   onPressed: () {},
          // ),
          // const AppointmentCardWidget(),
          TextTitle(
              txtt: 'General Cases'.tr,
              onPressed: () {
                Get.toNamed(AppRoutes.unassignedCasesDoctor);
              }),
          
          Center(
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom :100),
              shrinkWrap: true,
              //physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical:8),
                  child: CasContainer(caseModel: controller.cases[index]),
                );
              },
            ),
          ),
          
          // Center(
          //   child: MaterialButton(
          //     onPressed: () {
          //       Get.toNamed(AppRoutes.unassignedCasesDoctor);
          //     },
          //     child: Container(
          //       alignment: Alignment.center,
          //       width: double.infinity,
          //       height: 50,
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(20),
          //         gradient: const LinearGradient(
          //             begin: Alignment.topLeft,
          //             end: Alignment.bottomRight,
          //             colors: [
          //               Color(0xFF4A6BAD),
          //               Color.fromRGBO(25, 63, 138, 0.48),
          //             ]),
          //         boxShadow: const [
          //           BoxShadow(
          //             color: Color(0xffC3C3C3),
          //             spreadRadius: 2,
          //             blurRadius: 4,
          //             offset: Offset(0, 4), // changes position of shadow
          //           ),
          //         ],
          //       ),
          //       child: FittedBox(
          //         child: Text(
          //           "See More".tr,
          //           style:
          //               const TextStyle(color: Colors.white, fontSize: 25),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        //  SizedBox(height: 100,)
        ],
      ),
    );
  }
}
