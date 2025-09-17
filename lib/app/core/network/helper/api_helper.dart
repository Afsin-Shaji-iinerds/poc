import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../utils/helper/widgets/helper_widgets.dart';

class ApiHelper {
  /// Generic and reusable API caller method.
  ///
  /// - [loadingFlag]: Prevents duplicate API calls while already loading.
  /// - [request]: The function that performs the Dio request.
  /// - [onSuccess]: Called when status code is 2xx.
  /// - [onFailure]: Called when status code is not 2xx (e.g., 400, 500).
  /// - [onDioError]: Called for network/Dio exceptions.
  /// - [onError]: Called for other unhandled exceptions.
  /// - [debugLog]: Enables internal logging in debug mode.
  static Future<T?> callApi<T>({
    required RxBool loadingFlag,
    required Future<dio.Response> Function() request,
    required T Function(dio.Response response) onSuccess,
    void Function(dio.Response response)? onFailure,
    void Function(dio.DioException e)? onDioError,
    void Function(Object e)? onError,
    bool debugLog = false,
    bool showDefaultSnackbarOnFailure = true,
    bool showDefaultSnackbarOnError = true,
  }) async {
    if (loadingFlag.value) {
      return null;
    }

    loadingFlag.value = true;

    try {
      final dio.Response response = await request();
      final int statusCode = response.statusCode ?? 0;

      if (_isSuccessStatus(statusCode)) {
        if (debugLog) {
          _logSuccess(response);
        }
        return onSuccess(response);
      } else {
        if (debugLog) {
          _logFailure(response);
        }
        if (showDefaultSnackbarOnFailure) {
          final String message = _extractErrorMessage(response.data) ?? 'Something went wrong';
          HelperWidgets.buildStatusSnackBar(
            title: 'Error',
            message: message,
            isSuccess: false,
          );
        }
        onFailure?.call(response);
      }
    } on dio.DioException catch (e) {
      if (debugLog) {
        _logDioError(e);
      }
      if (showDefaultSnackbarOnError) {
        final String message = e.message ?? 'Network error occurred';
       if(e.response==null || e.response!.statusCode!=401){ 
        HelperWidgets.buildStatusSnackBar(
          title: 'Network Error',
          message: message,
          isSuccess: false,
        );
        }
      }
      onDioError?.call(e);
    } catch (e, stackTrace) {
      if (debugLog) {
        _logGenericError(e, stackTrace);
      }
      if (showDefaultSnackbarOnError) {
        HelperWidgets.buildStatusSnackBar(
          title: 'Unexpected Error',
          message: e.toString(),
          isSuccess: false,
        );
      }
      onError?.call(e);
    } finally {
      loadingFlag.value = false;
    }

    return null;
  }

  static bool _isSuccessStatus(int statusCode) => statusCode >= 200 && statusCode < 300;

  static String? _extractErrorMessage(dynamic data) {
    if (data is Map<String, dynamic>) {
      return data['message'] ?? data['error'];
    }
    return null;
  }

  static void _logSuccess(dio.Response response) {
    debugPrint('API Success [${response.statusCode}] → ${response.requestOptions.uri}');
  }

  static void _logFailure(dio.Response response) {
    debugPrint('API Failure [${response.statusCode}] → ${response.requestOptions.uri}');
    debugPrint('Response Data: ${response.data}');
  }

  static void _logDioError(dio.DioException e) {
    debugPrint('DioException: ${e.message}');
    if (e.response != null) {
      debugPrint('Status: ${e.response?.statusCode}');
      debugPrint('URI: ${e.requestOptions.uri}');
      debugPrint('Data: ${e.response?.data}');
    }
  }

  static void _logGenericError(Object e, StackTrace stackTrace) {
    debugPrint('Unexpected Error: $e');
    debugPrint('StackTrace: $stackTrace');
  }
}
