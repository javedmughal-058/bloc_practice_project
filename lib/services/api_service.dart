import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

mixin ApiService {

  final Dio _dio = Dio();
  Connectivity connectivity = Connectivity();


  Future<bool> checkInternetConnection() async {
    var connectivityResult = await connectivity.checkConnectivity();
    if (connectivityResult.isEmpty) {
      return false;
    }
    return true;
  }



  // POST request
  Future<Response> postData({
    required String apiUrl,
    required Map<String, dynamic> body,
    Map<String, String>? headers,
  }) async {
    try {
      // Check for internet connection
      if (!await checkInternetConnection()) {
        throw Exception('No Internet Connection');
      }

      final response = await _dio.post(apiUrl, data: body, options: Options(headers: headers));
      return response;
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow; // Rethrow after handling the error
    } catch (e) {
      throw Exception('An unknown error occurred: $e');
    }
  }

  // GET request
  Future<Response> getData({
    required String apiUrl,
    Map<String, String>? headers,
  }) async {
    try {
      // Check for internet connection
      if (!await checkInternetConnection()) {
        throw Exception('No Internet Connection');
      }
      print("url $apiUrl");
      final response = await _dio.get(apiUrl, options: Options(headers: headers));
      return response;
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow; // Rethrow after handling the error
    } catch (e) {
      throw Exception('An unknown error occurred: $e');
    }
  }

  // Error handling for Dio errors
  void _handleDioError(DioException e) {
    String errorMessage;
    print("Error Type ${e.type}");

    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        errorMessage = 'Connection timed out. Please try again.';
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = 'Send request timed out. Please try again.';
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = 'Receive response timed out. Please try again.';
        break;
      case DioExceptionType.connectionError:
        errorMessage = 'Connection Error.';
        break;
      case DioExceptionType.cancel:
        errorMessage = 'Request to API was cancelled.';
        break;
      default:
        errorMessage = 'Unknown issue: ${e.message}';
        break;
    }
    throw Exception(errorMessage);
  }
}
