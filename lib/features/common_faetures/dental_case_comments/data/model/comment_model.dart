class CommentModel {
  final String caseId;
  final String userName;
  final String comment;
  final DateTime time;
  final String role;

  CommentModel({
    required this.caseId,
    required this.userName,
    required this.comment,
    required this.time,
    required this.role,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      caseId: json['id'],
      userName: json['fullName'],
      comment: json['comment'],
      role: json['role'],
      time: DateTime.parse(json['timeStamp']),
    );
  }
}
            // "id": "f47e223f-9ae0-4f11-a738-889a8232f8fa",
            // "userName": "YousefHassan974",
            // "comment": "yaba roooood dlwa2ti",
            // "timeStamp": "2024-04-29T11:01:55.2005983Z"