import 'package:dio/dio.dart';

import 'interceptors.dart';

abstract class HttpProxyInterface {
  Dio instance();
}

class HttpImpl extends HttpProxyInterface {
  late Dio _http;
  HttpImpl() {
    _http = Dio()
      ..interceptors.add(AppInterceptors())
      ..options.connectTimeout = 40000
      ..options.receiveTimeout = 40000
      ..options.sendTimeout = 3000;
  }

  @override
  Dio instance() => _http;
}
