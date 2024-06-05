import 'package:dentalmatching/core/class/request_status.dart';
import 'package:dentalmatching/core/functions/block_action.dart';
import 'package:dentalmatching/core/functions/handling_response_type.dart';
import 'package:dentalmatching/core/services/my_services.dart';
import 'package:dentalmatching/core/shared/dialogue_without_buttons.dart';
import 'package:dentalmatching/features/common_faetures/dental_case_comments/controller/comments_controller_abstract.dart';
import 'package:dentalmatching/features/common_faetures/dental_case_comments/data/comments_data.dart';
import 'package:dentalmatching/features/common_faetures/dental_case_comments/data/model/comment_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentsControllerImpl extends CommentsControllerAbstract {
  MyServices myServices = Get.find();
  CommentsData dataObject = CommentsData(Get.find());
  RequestStatus? requestStatus;

  late TextEditingController commentController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<CommentModel> comments = [];

  @override
  void onInit() {
    commentController = TextEditingController();
    super.onInit();
  }

  @override
  void getComments({required String caseId, required String token}) async {
    comments = [];
    requestStatus = RequestStatus.LOADING;
    update();
    var response = await dataObject.getComments(caseId: caseId, token: token);
    if (kDebugMode) {
      print(response.toString());
    }
    update();
    requestStatus = HandlingResponseType.fun(response);
    if (kDebugMode) {
      print("joe ;${requestStatus.toString()}");
    }
    if (requestStatus == RequestStatus.SUCCESS) {
      if (response["success"] == true && response["data"] != null) {
        List<dynamic> responseData = response["data"];
        for (var data in responseData) {
          CommentModel comment = CommentModel.fromJson(data);
          comments.add(comment);
        }
      } else if (response["data"] == null) {
        requestStatus = RequestStatus.EMPTY_SUCCESS;
        update();
      }
    } else if (requestStatus == RequestStatus.UNAUTHORIZED_FAILURE) {
      customDialoge(
          title: "Warning".tr,
          middleText: "Case not found or has been deleted recently");
    } else if (requestStatus == RequestStatus.BLOCKED_USER) {
      blockAction();
    } else {
      customDialoge(
          title: "Warning".tr, middleText: "Server Error Please Try Again");
    }

    update();
  }

  @override
  void addComment({required String caseId, required String token}) async {
    if (formKey.currentState!.validate()) {
      requestStatus = RequestStatus.LOADING;
      update();
      var response = await dataObject.addComments(
          caseId: caseId, token: token, comment: commentController.text);
      if (kDebugMode) {
        print(response.toString());
      }
      update();
      requestStatus = HandlingResponseType.fun(response);
      if (kDebugMode) {
        print("joe ;${requestStatus.toString()}");
      }
      if (requestStatus == RequestStatus.SUCCESS) {
        if (response["success"] == true) {
          getComments(caseId: caseId, token: token);
          commentController.clear();
        }
      } else if (requestStatus == RequestStatus.UNAUTHORIZED_FAILURE) {
        customDialoge(
            title: "Warning".tr,
            middleText: "Case not found or has been deleted recently");
      } else if (requestStatus == RequestStatus.BLOCKED_USER) {
        blockAction();
      } else {
        customDialoge(
            title: "Warning".tr, middleText: "Server Error Please Try Again");
      }

      update();
    }
  }
}
