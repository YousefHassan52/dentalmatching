// import 'package:dentalmatching/features/patient_features/AddCase/Controller/FormController.dart';
// import 'package:dentalmatching/features/patient_features/AddCase/Views/Widget/CasesCheckList.dart';
// import 'package:dentalmatching/features/patient_features/AddCase/Views/Widget/RadioList.dart';
// import 'package:dentalmatching/features/patient_features/AddCase/data/staticData.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class KnownCheckWidget extends StatelessWidget {
//   const KnownCheckWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     StaticData list = StaticData();

//     return GetBuilder<AddCaseController>(
//       builder: (controller) {
//         return RadioListWidget(
//           cont: list.caseStatus,
//           onChanged: (value) {
//             controller.handleSelectionKnown(value!);
//             if (value == 'Known') {
//               Get.defaultDialog(
//                   title: 'Dental Case:', content: const CasesChecklist());
//             }
//           },
//           groupValue: controller.selected,
//         );
//       },
//     );
//   }
// }
import 'package:dentalmatching/features/patient_features/AddCase/Controller/FormController.dart';
import 'package:dentalmatching/features/patient_features/AddCase/Views/Widget/CasesCheckList.dart';
import 'package:dentalmatching/features/patient_features/AddCase/Views/Widget/RadioList.dart';
import 'package:dentalmatching/features/patient_features/AddCase/data/staticData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KnownCheckWidget extends StatelessWidget {
  const KnownCheckWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StaticData list = StaticData();

    return GetBuilder<AddCaseController>(
      builder: (controller) {
        return RadioListWidget(
          cont: list.caseStatus,
          onChanged: (value) {
            controller.handleSelectionKnown(value!);
            if (value == 'Known'||value =='اعلم') {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child:  Column(
                        children: [
                          Text(
                            'Dental Cases'.tr,
                            style: const TextStyle(fontSize: 20),
                          ),
                          const CasesChecklist(),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            else if(value == 'Unknown' || value == 'لا اعلم'){
              controller.selectedDentalCases = [];
              print(controller.selectedDentalCases);

            }
          },
          groupValue: controller.selected,
        );
      },
    );
  }
}
