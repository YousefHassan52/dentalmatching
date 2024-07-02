// ignore_for_file: avoid_print

import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/core/shared/shimmer_column.dart';
import 'package:dentalmatching/features/common_faetures/dental_case_comments/controller/comments_controller_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentsOnCase extends StatelessWidget {
  const CommentsOnCase({
    super.key,
    required this.token,
    required this.caseid,
  });
  final String token;
  final String caseid;

  @override
  Widget build(BuildContext context) {
    CommentsControllerImpl commentsController =
        Get.put(CommentsControllerImpl());
    return Container(
      alignment: Alignment.topLeft,
      height: Get.height * 0.5,
      width: double.infinity,
      margin: const EdgeInsets.only(
        right: 15,
        left: 5,
        top: 20,
        bottom: 20,
      ),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            color: Colors.grey,
            blurStyle: BlurStyle.outer,
            offset: Offset(5, 7),
            spreadRadius: 10,
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          GetBuilder<CommentsControllerImpl>(builder: (controller) {
            if (controller.requestStatus == RequestStatus.SUCCESS) {
              return Expanded(
                child: ListView.builder(
                  itemCount: controller.comments.length,
                  itemBuilder: (context, index) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: controller
                                    .comments[index].profileImageLink !=
                                null
                            ? NetworkImage(controller.comments[index]
                                .profileImageLink!) as ImageProvider<Object>
                            : controller.comments[index].role.toLowerCase() ==
                                    "doctor"
                                ? const AssetImage('assets/images/doctor.png')
                                    as ImageProvider<Object>
                                : const AssetImage(
                                        'assets/images/profilepicture.png')
                                    as ImageProvider<Object>,
                        radius: 20,
                        backgroundColor: const Color.fromARGB(255, 26, 67, 143),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      controller.comments[index].role
                                                  .toLowerCase() ==
                                              "doctor"
                                          ? "Dr. ${controller.comments[index].fullName}"
                                          : controller.comments[index].fullName,
                                      style: Styles.textStyle22Blue,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                if (controller.comments[index].userName ==
                                    controller.userName)
                                  Flexible(
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: IconButton(
                                          onPressed: () {
                                            controller.removeComment(
                                                caseId: caseid,
                                                token: token,
                                                commentId: controller
                                                    .comments[index].commentId);
                                          },
                                          icon: const Icon(
                                            Icons.cancel,
                                            size: 20,
                                            color: Colors.red,
                                          )),
                                    ),
                                  ),
                              ],
                            ),
                            Container(
                              width: double.infinity,
                              margin: const EdgeInsets.all(5),
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xFFCFD7EC),
                              ),
                              child: Text(
                                controller.comments[index].comment,
                                style: Styles.boxText,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else if (controller.requestStatus == RequestStatus.LOADING) {
              return const Expanded(child: ShimmerListColumn());
            } else if (controller.requestStatus ==
                RequestStatus.EMPTY_SUCCESS) {
              return const FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Center(child: Text("There is no comments yet")));
            } else {
              return const FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Center(child: Text("UnExpected Error")));
            }
          }),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: commentsController.formKey,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: commentsController.commentController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Add a comment".tr;
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Add a comment...'.tr,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Material(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        print("token ya jooe: $token \ncaseid: $caseid");
                        commentsController.addComment(
                            caseId: caseid, token: token);
                        // Handle button tap
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: const Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
