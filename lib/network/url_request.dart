import 'package:ecommerce/network/base_route.dart';
import 'package:ecommerce/network/network_error.dart';
import 'package:dio/dio.dart';

class RouterInput {
  Map<String, dynamic>? body;
  Map<String, dynamic>? queryParameters;

  RouterInput({this.body, this.queryParameters});
}

class UrlRequest {
  final dio = Dio();
  final Map<String, dynamic> _headers = {'Accept': 'application/json'};

  Future<dynamic> makeNetworkRequest(BaseRoute route, RouterInput input) async {
    if (route.authHeaders !=  null) {
      _headers.addAll(route.authHeaders!);
    }
    final options = RequestOptions(
      path: route.path,
      baseUrl: "https://dummyjson.com", 
      data: input.body,
      queryParameters: input.queryParameters, 
      method: route.method.value, 
      headers: _headers, 
      responseType: ResponseType.json);
    final response = await dio.fetch(options);
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return response.data;
    }
    final exception = _getException(response.statusCode!);
    throw exception;
  }

  NetworkError _getException(int statusCode) {
    switch (statusCode) {
      case 400:
      return NetworkError(REQUEST_DATA_VALIDATION_ERROR, statusCode);
      case 401:
      return NetworkError(UNAUHTENTICATED_REQUEST, statusCode);
      case 403:
      return NetworkError(BAD_REQUEST, statusCode);
      case 404:
      return NetworkError(RECORD_NOT_FOUND, statusCode);
      case >=500:
      return NetworkError(IINTERNAL_SERVER_ERROR, statusCode);
    }
    return NetworkError(IINTERNAL_SERVER_ERROR, statusCode);
  }
}