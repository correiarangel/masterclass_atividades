import 'dart:developer';

import 'package:dio/dio.dart';

class TodoService {
  final Dio dio;

  TodoService(this.dio);

  Future<Response> get({required url}) async {
    late Response response;
    try {
      response = await dio.get(url);
    } catch (e, s) {
      log('GET/ TodoService', error: e, stackTrace: s);
      response = Response(
        requestOptions: RequestOptions(path: ''),
        data: [],
        statusCode: 500,
      );
    }
    return response;
  }

  Future<Response> put({
    required String id,
    required url,
    required Map<String, dynamic> jsonParam,
  }) async {
    late Response response;
    try {
      var urlFull = '$url/$id';
      response = await dio.put(urlFull, data: jsonParam );
    } catch (e, s) {
      log('PUT/ TodoService', error: e, stackTrace: s);
      response = Response(
        requestOptions: RequestOptions(path: ''),
        data: [],
        statusCode: 500,
      );
    }
    return response;
  }

  Future<Response> post({
    required url,
    required Map<String, dynamic> jsonParam,
  }) async {
    late Response response;
    try {
      response = await dio.post(url, data: jsonParam);
    } catch (e, s) {
      log('POST/ TodoService', error: e, stackTrace: s);
      response = Response(
        requestOptions: RequestOptions(path: ''),
        data: [],
        statusCode: 500,
      );
    }
    return response;
  }

    Future<Response> delete({
    required String id,
    required url,
  }) async {
    late Response response;
    try {
      var urlFull = '$url/$id';
      response = await dio.delete(urlFull);
    } catch (e, s) {
      log('DELETE/ TodoService', error: e, stackTrace: s);
      response = Response(
        requestOptions: RequestOptions(path: ''),
        data: [],
        statusCode: 500,
      );
    }
    return response;
  }
}
