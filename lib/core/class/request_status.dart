// ignore_for_file: constant_identifier_names

enum RequestStatus {
  LOADING,
  SUCCESS,
  FAILURE, // EX: ACCOUNT ALREADY EXIST
  SERVER_FAILURE,
  INTERNAL_SERVER_ERROR,
  OFFLINE_FAILURE,
  UNKOWN_FAILURE,
  UNAUTHORIZED_FAILURE,
  UNVERIFIED_DOCTOR_FAILURE,

  EMPTY_SUCCESS,
}
