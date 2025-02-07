import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio;

  ApiClient({Dio? dio}) : _dio = dio ?? Dio() {
    _dio.options
      ..baseUrl = 'https://api.example.com' // آدرس وب سرویس
      ..connectTimeout = const Duration(seconds: 10)
      ..receiveTimeout = const Duration(seconds: 10)
      ..headers = {'Content-Type': 'application/json'};

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
          // گرفتن توکن از حافظه (مثلاً از SharedPreferences)
          final token = "YOUR_ACCESS_TOKEN";
          if (token.isNotEmpty) {
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

  // مدیریت خطاها
  String _handleError(DioException error) {
    if (error.response != null) {
      final statusCode = error.response?.statusCode;
      final errorMessage = error.response?.data["message"] ?? "خطای نامشخص";

      if (statusCode == 401) {
        return "احراز هویت ناموفق! لطفاً دوباره وارد شوید.";
      } else if (statusCode == 403) {
        return "شما اجازه دسترسی به این بخش را ندارید.";
      } else if (statusCode == 404) {
        return "آیتم مورد نظر یافت نشد.";
      } else if (statusCode == 500) {
        return "خطای سرور! لطفاً بعداً تلاش کنید.";
      } else {
        return errorMessage;
      }
    }
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return "اتصال به سرور برقرار نشد.";
      case DioExceptionType.sendTimeout:
        return "ارسال اطلاعات زمان‌بر شد.";
      case DioExceptionType.receiveTimeout:
        return "دریافت اطلاعات زمان‌بر شد.";
      case DioExceptionType.cancel:
        return "درخواست لغو شد.";
      case DioExceptionType.unknown:
      default:
        return "خطای نامشخص رخ داد.";
    }
  }
}
