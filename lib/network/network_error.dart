
final class NetworkError implements Exception {
  int? statusCode;
  String message;

  NetworkError(this.message, this.statusCode);
}
const String RECORD_NOT_FOUND = "Record not found";
const String UNAUHTENTICATED_REQUEST = "UnauthenticatedRequest";
const String BAD_REQUEST = "Bad request";
const String IINTERNAL_SERVER_ERROR = "Internal server error";
const String REQUEST_DATA_VALIDATION_ERROR = "The request contains bad syntax. There's an issue in request";