import 'package:dio/dio.dart';
import 'package:goldex/domain/repository/secure_storage_service.dart';

class ApiClient {
  final Dio _dio;
  SecureStorageService secureStorageService;

  ApiClient({Dio? dio, required this.secureStorageService}) : _dio = dio ?? Dio() {
    _dio.options
      ..baseUrl = 'http://app.goldex.me/api/v1/' // آدرس وب سرویس
      ..connectTimeout = const Duration(seconds: 20)
      ..receiveTimeout = const Duration(seconds: 20)
      ..headers = {'accept': 'application/json', 'Client': 'U-1.3.2', 'Content-Type': 'application/json'};

    // اضافه کردن لاگر و احراز هویت
    _dio.interceptors.addAll([
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        error: true,
      ),
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          String? token = await secureStorageService.readToken();
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
      ),
    ]);
  }

  // متد GET
  Future<Response> getRequest(String endpoint, {Map<String, dynamic>? queryParameters}) async {
    try {
      return await _dio.get(endpoint, queryParameters: queryParameters);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // متد POST
  Future<Response> postRequest(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      return await _dio.post(endpoint, data: data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // متد PUT
  Future<Response> putRequest(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      return await _dio.put(endpoint, data: data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // متد DELETE
  Future<Response> deleteRequest(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      return await _dio.delete(endpoint, data: data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

// Error handling
  String _handleError(DioException error) {
    if (error.response != null) {
      final statusCode = error.response?.statusCode;
      final errorMessage = error.response?.data["Message"] ??error.response?.data["message"]?? "Unknown error";

      if (errorMessage != null) {
        return errorMessage;
      } else if (statusCode == 401) {
        return "Authentication failed! Please log in again.";
      } else if (statusCode == 403) {
        return "You do not have permission to access this section.";
      } else if (statusCode == 404) {
        return "The requested item was not found.";
      } else if (statusCode == 500) {
        return "Server error! Please try again later.";
      }
    }
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return "Failed to connect to the server.";
      case DioExceptionType.sendTimeout:
        return "Sending data took too long.";
      case DioExceptionType.receiveTimeout:
        return "Receiving data took too long.";
      case DioExceptionType.cancel:
        return "The request was canceled.";
      case DioExceptionType.unknown:
      default:
        return "An unknown error occurred.";
    }
  }
}
