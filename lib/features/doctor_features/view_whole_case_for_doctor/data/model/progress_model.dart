class ProgressModel {
  final String caseId;
  final String id;
  final String doctorName;
  final String progressMessage;
  final DateTime timestamp;

  ProgressModel({
    required this.caseId,
    required this.id,
    required this.doctorName,
    required this.progressMessage,
    required this.timestamp,
  });

  // Factory constructor to create an instance from JSON
  factory ProgressModel.fromJson(Map<String, dynamic> json) {
    return ProgressModel(
      caseId: json['caseId'],
      id: json['id'],
      doctorName: json['doctorName'],
      progressMessage: json['progressMessage'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'caseId': caseId,
      'id': id,
      'doctorName': doctorName,
      'progressMessage': progressMessage,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
