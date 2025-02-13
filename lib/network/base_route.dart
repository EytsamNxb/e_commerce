abstract class BaseRoute {
  String get path;
  HttpMethod get method;
  Map<String, dynamic>? get authHeaders;
}

enum HttpMethod {
  get, post, put, delete
}

extension HttpMethodExtension on HttpMethod {
  String get value {
    switch (this) {
      case HttpMethod.get:
        return "GET";
      case HttpMethod.post:
        return "POST";
         case HttpMethod.put:
        return "PUT";
      case HttpMethod.delete:
        return "DELETE";
    }
  }
}