import 'package:dentalmatching/core/class/request_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/functions/validator.dart';
import 'package:dentalmatching/features/doctor_features/view_whole_case_for_doctor/controller/progress_controller.dart';

class AddProgress extends StatelessWidget {
  const AddProgress({
    Key? key,
    required this.caseId,
  }) : super(key: key);
  final String caseId;

  @override
  Widget build(BuildContext context) {
    Get.put(ProgressController());

    return GetBuilder<ProgressController>(
      builder: (controller) {
        return Card(
          color: AppColors.blueLightTextColor,
          shadowColor: const Color.fromARGB(255, 68, 67, 67),
          elevation: 5.0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(
                    "Add Progress".tr,
                    style: const TextStyle(color: Colors.white),
                  ),
                  trailing: IconButton(
                    onPressed: controller.toggleAdd,
                    icon: Icon(
                      controller.isExpandedAdd ? Icons.expand_less : Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
                if (controller.isExpandedAdd) ...[
                  const SizedBox(height: 16),
                  Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          onChanged: (value) => controller.progressText = value,
                          controller: controller.msgController,
                          validator: (value) {
                            return AppValidator.textFormFieldValidator(
                                value!, "Progress");
                          },
                          decoration: InputDecoration(
                            hintText: "Write your progress here ...".tr,
                            hintStyle: const TextStyle(color: Colors.white70),
                            errorStyle:
                                const TextStyle(color: Color(0xFF880900)),
                          ),
                          style: const TextStyle(color: Colors.white),
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                        ),
                        const SizedBox(
                            height: 8), // Add space between form fields
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: controller.cancelAdd,
                              child: Text(
                                "Cancel".tr,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            const SizedBox(
                                width: 8), // Add space between buttons
                            TextButton(
                              onPressed: () {
                                controller.saveProgress(
                                    controller.msgController.text, caseId);
                              },
                              child: Text(
                                "Save".tr,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        if (controller.requestStatus == RequestStatus.LOADING)
                          LinearProgressIndicator(),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
