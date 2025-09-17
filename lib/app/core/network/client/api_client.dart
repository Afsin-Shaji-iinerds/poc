import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';


class ApiClient {
  ApiClient() {
    initClient();
  }

  late Dio dio;

  late BaseOptions _baseOptions;

 Future<void> initClient() async {
    _baseOptions = BaseOptions(
        // baseUrl: UrlConst.baseUrl,
        connectTimeout: const Duration(milliseconds: 100000),
        receiveTimeout: const Duration(milliseconds: 100000),
        followRedirects: true,
        headers: <String, dynamic>{
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
        },
        receiveDataWhenStatusError: true);

    dio = Dio(_baseOptions);

    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final HttpClient client = HttpClient();
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) {
          return true; // Verify the certificate.
        };
        return client;
      },
    );
   //dio.interceptors.add(AuthInterceptor());
    // dio.addSentry();
  }
}
