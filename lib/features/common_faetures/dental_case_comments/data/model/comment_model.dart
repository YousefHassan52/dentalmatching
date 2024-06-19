class CommentModel {
  final String commentId;
  final String fullName;
  final String userName;
  final String comment;
  final DateTime time;
  final String role;
  final String? profileImageLink;

  CommentModel({
    required this.commentId,
    required this.fullName,
    required this.userName,
    required this.comment,
    required this.time,
    required this.role,
    this.profileImageLink,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      commentId: json['id'],
      fullName: json['fullName'],
      userName: json['userName'],
      comment: json['comment'],
      profileImageLink: json['profileImageLink'],
      role: json['role'],
      time: DateTime.parse(json['timeStamp']),
    );
  }
}
