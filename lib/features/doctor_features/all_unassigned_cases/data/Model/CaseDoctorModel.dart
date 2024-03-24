class CaseDoctorModel {
  final String caseId;
  final String patientName;
  final String phoneNumber;
  final int patientAge;
  final String patientCity;
  final String description;
  final bool isKnown;
  late bool isAssigned;
  final List<String> chronicDiseases;
  final List<String> dentalDiseases;
  final List<String> mouthImages;
  final List<String> xrayImages;
  final List<String> prescriptionImages;
  final String? googleMapLink;
  final String? appointmentDateTime;

  CaseDoctorModel({
    required this.caseId,
    required this.patientName,
    required this.phoneNumber,
    required this.patientAge,
    required this.patientCity,
    required this.description,
    required this.isKnown,
    required this.isAssigned,
    required this.chronicDiseases,
    required this.dentalDiseases,
    required this.mouthImages,
    required this.xrayImages,
    required this.prescriptionImages,
    this.googleMapLink,
    this.appointmentDateTime,
  });

  factory CaseDoctorModel.fromJson(Map<String, dynamic> json) {
    return CaseDoctorModel(
      caseId: json['caseId'],
      googleMapLink: json['googleMapLink'],
      appointmentDateTime: json['appointmentDateTime'],
      patientName: json['patientName'],
      phoneNumber: json['phoneNumber'],
      patientAge: json['patientAge'],
      patientCity: json['patientCity'],
      description: json['description'],
      isKnown: json['isKnown'],
      isAssigned: json['isAssigned'],
      chronicDiseases: List<String>.from(json['chronicDiseases']),
      dentalDiseases: List<String>.from(json['dentalDiseases']),
      mouthImages: List<String>.from(json['mouthImages']),
      xrayImages: List<String>.from(json['xrayImages']),
      prescriptionImages: List<String>.from(json['prescriptionImages']),
    );
  }

  @override
  String toString() {
    return 'DoctorCaseModel(caseId: $caseId, patientName: $patientName, phoneNumber: $phoneNumber, patientAge: $patientAge, patientCity: $patientCity, description: $description, isKnown: $isKnown, isAssigned: $isAssigned, chronicDiseases: $chronicDiseases, dentalDiseases: $dentalDiseases, mouthImages: $mouthImages, xrayImages: $xrayImages, prescriptionImages: $prescriptionImages)';
  }
}
