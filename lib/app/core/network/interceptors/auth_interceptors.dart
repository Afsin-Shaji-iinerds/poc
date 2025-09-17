// import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:healthkarma/app/common/const/url_const/url_const.dart';
// import 'package:healthkarma/app/common/services/auth_token_servic.dart';
// import 'package:healthkarma/app/common/services/token_refresh_service.dart';
// import 'package:healthkarma/app/core/network/client/api_client.dart';

// class AuthInterceptor extends Interceptor {
//   AuthInterceptor();

//   @override
//   Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
//     debugPrint('Request: ${options.method} ${options.uri}');
//     debugPrint('Headers: ${options.headers}');
//     debugPrint('Body: ${options.data}');
//     log("${options.path.contains('/secureApi')}  ${AuthTokenService.authToken.secureAccessToken}");
//     if (options.path.contains('/secureApi') && AuthTokenService.authToken.secureAccessToken != null) {
//       options.headers['Authorization'] = 'Bearer ${AuthTokenService.authToken.secureAccessToken}';
//     }

//     return handler.next(options);
//   }

//   @override
//   Future<void> onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) async {
//     debugPrint('Response: ${response.statusCode} ${response.data}');
//     return handler.next(response);
//   }
//     @override
//   Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
//     final RequestOptions requestOptions = err.requestOptions;
//  Future<Response<dynamic>>retryRequest()async{
//       await TokenRefreshService.ensureTokenIsFresh();
//         final Options newOptions = Options(
//           method: requestOptions.method,
//           headers: <String, dynamic>{
//             ...requestOptions.headers,
//             'Authorization': 'Bearer ${AuthTokenService.authToken.secureAccessToken}',
//           },
//           responseType: requestOptions.responseType,
//           contentType: requestOptions.contentType,
//           validateStatus: requestOptions.validateStatus,
//           sendTimeout: requestOptions.sendTimeout,
//           receiveTimeout: requestOptions.receiveTimeout,
//         );

//         final Response<dynamic> retryResponse = await ApiClient().dio.request(
//           requestOptions.path,
//           data: requestOptions.data,
//           queryParameters: requestOptions.queryParameters,
//           options: newOptions,
//         );
//         return retryResponse;
//     }

//   // if it's a public API 401, just forward the error
//   if (err.response?.statusCode == 401 && requestOptions.path.contains('/publicApi')) {
//     log("publicApi 401, forwarding error");
//     return handler.reject(err);     
//   }
//     if (err.response?.statusCode == 401) {
//         log("path ${requestOptions.path}");
//       if (requestOptions.path == UrlConst.generateNewToken) {
//         await AuthTokenService.navigateToAuthPageWithCleanup(retryRequest:retryRequest);
//         return;
//       }

//       try {
        
//       final Response<dynamic> retryResponse= await retryRequest();
//         return handler.resolve(retryResponse);
//       } catch (_) {
       
//         await AuthTokenService.navigateToAuthPageWithCleanup(retryRequest:retryRequest);
//         return handler.reject(err);
//       }
//     }


//     return handler.next(err);
//   }
// }