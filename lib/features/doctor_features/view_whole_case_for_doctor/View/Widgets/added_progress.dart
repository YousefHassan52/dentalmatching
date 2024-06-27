
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/functions/validator.dart';
import 'package:dentalmatching/features/doctor_features/view_whole_case_for_doctor/controller/progress_controller.dart';

class AddedProgress extends StatelessWidget {
  const AddedProgress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProgressController controller = Get.put(ProgressController());
    final String session = "Session".tr;

    return GetBuilder<ProgressController>(
      builder: (controller) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Column(
                children: List.generate(
                  controller.progressEntries.length,
                  (index) {
                    return Card(
                      color: AppColors.blueLightTextColor,
                      shadowColor: const Color.fromARGB(255, 68, 67, 67),
                      elevation: 5.0,
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              "$session ${index + 1}",
                              style: const TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                              controller.progressEntries[index]['date']!,
                              style: const TextStyle(
                                  color: Color.fromARGB(117, 191, 191, 191)),
                            ),
                            trailing: IconButton(
                              onPressed: () => controller.toggleAdded(index),
                              icon: Icon(
                                controller.expandedStates[index]
                                    ? Icons.expand_less
                                    : Icons.expand_more,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          if (controller.expandedStates[index])
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (controller.editStates[index])
                                    Form(
                                      key: controller.formKey,
                                      child: Column(
                                        children: [
                                          TextFormField(
                                            onChanged: (value) =>
                                                controller.progressText = value,
                                            controller:
                                                controller.linkTextController,
                                            validator: (value) {
                                              return AppValidator
                                                  .textFormFieldValidator(
                                                      value!, "Progress");
                                            },
                                            decoration: InputDecoration(
                                              hintText:
                                                  "Edit your progress here ..."
                                                      .tr,
                                              hintStyle: const TextStyle(
                                                  color: Colors.white70),
                                            ),
                                            style: const TextStyle(
                                                color: Colors.white),
                                            maxLines: null,
                                            keyboardType:
                                                TextInputType.multiline,
                                          ),
                                          FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                TextButton(
                                                  onPressed: () => controller
                                                      .cancelEdit(index),
                                                  child: Text(
                                                    "Cancel".tr,
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                                TextButton(
                                                  onPressed: () => controller
                                                      .saveEditedProgress(
                                                          index,
                                                          controller
                                                              .linkTextController
                                                              .text),
                                                  child: Text(
                                                    "Save".tr,
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  else
                                    Container(
                                      constraints: BoxConstraints(
                                        maxWidth: constraints.maxWidth *
                                            0.9, // Adjust as needed
                                      ),
                                      decoration: const BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 8, 38, 102),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          controller.progressEntries[index]
                                              ['text']!,
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  if (!controller.editStates[index])
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                          onPressed: () =>
                                              controller.editProgress(index),
                                          child:  Text(
                                            "Edit".tr,
                                            style:
                                                const TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}