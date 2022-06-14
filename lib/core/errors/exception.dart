import 'package:adama_agropacking_flutter_web/core/services/https/http_service_interface.dart';

class ApiException implements Exception {
  final String msg;
  final int statusCode;

  ApiException({required this.statusCode, this.msg = 'Erro desconhecido'});

  ApiException.fromResponse(ClientResponse response)
      : statusCode = response.statusCode,
        msg = response.toString();
}
