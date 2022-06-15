import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

class CustomDioDatasource {
  late Dio _dio;
  Dio get instance => _dio;

  CustomDioDatasource.getInstance() {
    _dio = Dio(getOptions());
    _dio.interceptors.add(interpceptorResponse());
    _dio.interceptors.add(interpceptorRequest());
    _dio.interceptors.add(interpceptorOnError());
  }

  BaseOptions getOptions() => BaseOptions(
        baseUrl: 'url base',
      );
}

InterceptorsWrapper interpceptorRequest() {
  return InterceptorsWrapper(onRequest: (requestOptions, handler) {
    debugPrint("===== ON REQUEST =======");
    debugPrint(requestOptions.path);
    debugPrint(requestOptions.method);
    handler.next(requestOptions);
  });
}

InterceptorsWrapper interpceptorResponse() {
  return InterceptorsWrapper(onResponse: (responseOptins, handler) {
    debugPrint("======= ON RESPONSE =====");
    debugPrint(responseOptins.requestOptions.path);
    debugPrint(responseOptins.requestOptions.method);
    debugPrint(responseOptins.data.toString());
    handler.next(responseOptins);
  });
}

InterceptorsWrapper interpceptorOnError() {
  return InterceptorsWrapper(onError: (dioerror, handler) {
    debugPrint("===== ERROR ======");
    debugPrint(dioerror.message);
  });
}
