import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ApiService {
  ApiService() : _dio = Dio();

  final Dio _dio;

  Future<dynamic> get({
    required String url,
    Map<String, dynamic>? queryParamters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final resposta = await _dio.get(
        url,
        queryParameters: queryParamters,
        options: Options(headers: headers),
      );
      return resposta.data;
    } on DioError catch (e) {
      throw ApiError(
        message: e.response?.data is Map<String, dynamic> ? e.response?.data['message'] : null,
        statusCode: e.response?.statusCode,
        isOffline: e.message == 'XMLHttpRequest error.',
      );
    } catch (erro) {
      debugPrint(erro.toString());
    }
  }
}

class ApiError {
  ApiError({
    this.message,
    this.statusCode,
    this.isOffline,
  });
  final String? message;
  final int? statusCode;
  final bool? isOffline;

  @override
  String toString() => 'ApiError(message: $message, statusCode: $statusCode, isOffline: $isOffline)';
}
