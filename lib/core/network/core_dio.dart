import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

import '../enum/http_types.dart';
import 'i_core_dio.dart';
import 'result_model.dart';

class CoreDio with DioMixin implements Dio, ICoreDio {
  final BaseOptions options;

  CoreDio(this.options) {
    options = options;
    httpClientAdapter = DefaultHttpClientAdapter();
  }

  @override
  Future<ResultModel?> fetchNetwork(
    String path, {
    required HttpTypes type,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final Response<dynamic> response = await request(
        path,
        data: data,
        options: Options(method: type.rawValue),
        queryParameters: queryParameters,
      );
      switch (response.statusCode) {
        case HttpStatus.ok:
        case HttpStatus.created:
        case HttpStatus.accepted:
          return ResultModel(resultCode: 1, resultData: response.data);
        default:
          return null;
      }
    } catch (e) {
      return ResultModel(resultCode: -2020);
    }
  }
}