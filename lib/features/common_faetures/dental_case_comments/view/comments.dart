import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/core/constants/styles.dart';
import 'package:dentalmatching/core/shared/shimmer_column.dart';
import 'package:dentalmatching/features/common_faetures/dental_case_comments/controller/comments_controller_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
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
      height: Get.height * 0.7,
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
                        backgroundImage: controller.comments[index].role
                                    .toLowerCase() ==
                                "doctor"
                            ? AssetImage('assets/images/doctor.png')
                            : AssetImage('assets/images/profilepicture.png'),
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
                            Text(
                              controller.comments[index].role.toLowerCase() ==
                                      "doctor"
                                  ? "Dr. ${controller.comments[index].userName}"
                                  : controller.comments[index].userName,
                              style: Styles.textStyle22Blue,
                              overflow: TextOverflow.ellipsis,
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
              return Center(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 300,
                        width: 100,
                        child: SvgPicture.asset('assets/svg/Empty-pana.svg'),
                      ),
                      // Text("There is no comments")
                    ],
                  ),
                ),
              );
            } else {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: SvgPicture.asset('assets/svg/GroupRRR.svg'),
                      ),
                    ],
                  ),
                ),
              );
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
