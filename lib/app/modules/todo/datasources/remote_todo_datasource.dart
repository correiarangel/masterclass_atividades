import 'dart:developer';

import 'package:dio/dio.dart';

class RemoteTodoDataSource {
  final Dio dio;
  RemoteTodoDataSource(this.dio);

  Future<Response>? getTodos({required url}) async {
    late Response response;
    try {
      response = await dio.get(url);
    } on Exception catch (e, s) {
      log('GET/ TodoService', error: e, stackTrace: s);
      response = Response(
        requestOptions: RequestOptions(path: ''),
        data: [e],
        statusCode: 500,
      );
    }
    return response;
  }

  Future<Response>? addTodo({
    required url,
    required Map<String, dynamic> jsonParam,
  }) async {
    late Response response;
    try {
      response = await dio.post(url, data: jsonParam);
    } on Exception catch (e, s) {
      log('POST/ TodoService', error: e, stackTrace: s);
      response = Response(
        requestOptions: RequestOptions(path: ''),
        data: [e],
        statusCode: 500,
      );
    }
    return response;
  }

  Future<Response>? editar({
    required String id,
    required url,
    required Map<String, dynamic> jsonParam,
  }) async {
    late Response response;
    try {
      var urlFull = '$url/$id';
      response = await dio.put(urlFull, data: jsonParam);
    } on Exception catch (e, s) {
      log('PUT/ TodoService', error: e, stackTrace: s);
      response = Response(
        requestOptions: RequestOptions(path: ''),
        data: [e],
        statusCode: 500,
      );
    }
    return response;
  }

  Future<Response>? excluir({
    required String id,
    required url,
  }) async {
    late Response response;
    try {
      var urlFull = '$url/$id';
      response = await dio.delete(urlFull);
    } on Exception catch (e, s) {
      log('DELETE/ TodoService', error: e, stackTrace: s);
      response = Response(
        requestOptions: RequestOptions(path: ''),
        data: [e],
        statusCode: 500,
      );
    }
    return response;
  }
}
