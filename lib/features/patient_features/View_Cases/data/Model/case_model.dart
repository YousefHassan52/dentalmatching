class PatientCaseModel {
  final String caseId;
  final String patientName;
  final String phoneNumber;
  final int patientAge;
  final String patientCity;
  final String description;
  final bool isKnown;
  final bool isAssigned;
  final List<String> chronicDiseases;
  final List<String> dentalDiseases;
  final List<String> mouthImages;
  final List<String> xrayImages;
  final List<String> prescriptionImages;
  final String? doctorName;
  final String? doctorUniversity;
  final String? googleMapLink;
  final String? appointmentDateTime;

  PatientCaseModel({
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
    this.doctorName,
    this.doctorUniversity,
    this.googleMapLink,
    this.appointmentDateTime,
  });

  factory PatientCaseModel.fromJson(Map<String, dynamic> json) {
    return PatientCaseModel(
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
      doctorName: json['doctorName'],
      doctorUniversity: json['doctorUniversity'],
      chronicDiseases: List<String>.from(json['chronicDiseases']),
      dentalDiseases: List<String>.from(json['dentalDiseases']),
      mouthImages: List<String>.from(json['mouthImages']),
      xrayImages: List<String>.from(json['xrayImages']),
      prescriptionImages: List<String>.from(json['prescriptionImages']),
    );
  }

  @override
  String toString() {
    return 'MyCaseModel { '
        'caseId: $caseId, '
        'patientName: $patientName, '
        'phoneNumber: $phoneNumber, '
        'patientAge: $patientAge, '
        'patientCity: $patientCity, '
        'description: $description, '
        'isKnown: $isKnown, '
        'isAssigned: $isAssigned, '
        'chronicDiseases: $chronicDiseases, '
        'dentalDiseases: $dentalDiseases, '
        'mouthImages: $mouthImages, '
        'xrayImages: $xrayImages, '
        'prescriptionImages: $prescriptionImages'
        ' }';
  }
}
