import 'package:equatable/equatable.dart';

enum HttpMethod {
  get,
  post,
  delete,
  put,
  patch,
}

class ClientResponse extends Equatable {
  const ClientResponse({
    required this.data,
    required this.statusCode,
  });

  final dynamic data;
  final int statusCode;

  @override
  List<Object?> get props => [
        data,
        statusCode,
      ];
}

abstract class IHttpService {
  Future<ClientResponse> request({
    required String url,
    required HttpMethod method,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  });
}
